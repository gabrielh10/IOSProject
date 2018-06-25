//
//  AnswersViewController.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/21/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class AnswersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var questionSelected: UILabel!
    @IBOutlet weak var questionDetailsSelected: UILabel!
    
    var question : Question = Question(id: 0, question: "", questionDetails: "")
    
    @IBOutlet weak var answersTableView: UITableView!
    
    
    
    var answerTeste : Answer = Answer(id: 1, answer: "You could do this and that....", score: 0, idQuestion: 0)
    
  //  Answers.add(answerTeste)
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       Answers.sharedInstance.add(answer: answerTeste)
        
        questionSelected.text = question.question
        questionDetailsSelected.text = question.questionDetails
        
        answersTableView.delegate = self
        answersTableView.dataSource = self
        
    //    myTableView.delegate = self
     //   myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
       // return Answers.sharedInstance.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersCell", for: indexPath) as! AnswersTableCell
        
//        var answersShowed = Answers.getById(id: question.id)
        
        cell.id = indexPath.row
       // cell.answer.text = answersShowed[indexPath.row].answer
        cell.answer.text = answerTeste.answer
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
