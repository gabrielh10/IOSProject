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
    var start = 0
    @IBOutlet weak var answersTableView: UITableView!
    

    var answers:[Answer] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Ruche"
        //Adding questions to the singleton that represents a database
        
        if let savedAnswers = UsingDefaults.loadFromDefaults(key: "answers", objType: [Answer].self) as? [Answer]{
            answers = savedAnswers
        }
        if Answers.shared.count == 0{
            for answer in answers{
                Answers.shared.add(answer: answer)
            }
            print ("AQuiiiiiiiii")
        }
        questionSelected.text = question.question
        questionDetailsSelected.text = question.questionDetails
        
        answersTableView.delegate = self
        answersTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Answers.shared.getByQuestionId(id: question.id).count
       // return Answers.sharedInstance.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersCell", for: indexPath) as! AnswersTableCell
        cell.id = Answers.shared.getByQuestionId(id : question.id)[indexPath.row].id
        cell.answer.text = Answers.shared.getByQuestionId(id : question.id)[indexPath.row].answer
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    @IBAction func onClick(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueAnswersToNewAnswer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueAnswersToNewAnswer"){
            let newAnswerViewController = segue.destination as! NewAnswerViewController
            newAnswerViewController.idQuestion = question.id
            newAnswerViewController.question1 = question.question
            newAnswerViewController.questionDetail1 = question.questionDetails
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        answersTableView.reloadData()
    }
}
