//
//  ViewController.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/20/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    var exQuestion = Question(id: 1, question: "1How i do something ?", questionDetails: "Consider that i already try doing this like... ")
    var exQuestion1 = Question(id: 2, question: "2How i do something ?", questionDetails: "Consider that i already try... ")
    var exQuestion2 = Question(id: 3, question: "3How i do something ?", questionDetails: "Consider that i already try... ")
    var exQuestion3 = Question(id: 4, question: "4How i do something ?", questionDetails: "Consider that i already try... ")
    var exQuestion4 = Question(id: 5, question: "5How i do something ?", questionDetails: "Consider that i already try... ")
    
    lazy var questions : [Question] = [exQuestion, exQuestion1, exQuestion2, exQuestion3, exQuestion4]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Questions.shared.add(question: exQuestion)
        Questions.shared.add(question: exQuestion1)
        Questions.shared.add(question: exQuestion2)
        Questions.shared.add(question: exQuestion3)
        Questions.shared.add(question: exQuestion4)

        
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return questions.count
        return Questions.shared.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableCell
    /*
        cell.question.text = questions[indexPath.row].question
        cell.questionDetails.text = questions[indexPath.row].questionDetails
      */
        cell.question.text = Questions.shared.list[indexPath.row].question
        cell.questionDetails.text = Questions.shared.list[indexPath.row].questionDetails
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Segue to the second view controller
        self.performSegue(withIdentifier: "segueToAnswers", sender: self)
    }
    
    @IBAction func SegueToWriteQuestion(_ sender: Any) {
        performSegue(withIdentifier: "SegueToWriteQuestion", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
    if(segue.identifier == "segueToAnswers"){
        let answersViewController = segue.destination as! AnswersViewController
        
        if let teste = self.myTableView.indexPathForSelectedRow?.row{
        // set a variable in the second view controller with the data to pass
            answersViewController.question = questions[teste]
        }
    }
    }

}
