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
    

    
    var answerQ0: Answer = Answer(id: 0, answer: "0You could do this and that....", score: 0, idQuestion: 0)
    var answer1Q0 : Answer = Answer(id: 1, answer: "0You should do this and that....", score: 0, idQuestion: 0)
    var answer2Q0 : Answer = Answer(id: 2, answer: "0You might do this and that....", score: 0, idQuestion: 0)
    var answer3Q0 : Answer = Answer(id: 3, answer: "0You might do this and that....", score: 0, idQuestion: 0)
    
    var answerQ1: Answer = Answer(id: 4, answer: "1You could do this and that....", score: 0, idQuestion: 1)
    var answer1Q1 : Answer = Answer(id: 5, answer: "1You should do this and that....", score: 0, idQuestion: 1)
    var answer2Q1 : Answer = Answer(id: 6, answer: "1You might do this and that....", score: 0, idQuestion: 1)
    var answer3Q1 : Answer = Answer(id: 7, answer: "1You might do this and that....", score: 0, idQuestion: 1)
    
    
    var answerQ2: Answer = Answer(id: 8, answer: "2You could do this and that....", score: 0, idQuestion: 2)
    var answer1Q2 : Answer = Answer(id: 9, answer: "2You should do this and that....", score: 0, idQuestion: 2)
    var answer2Q2 : Answer = Answer(id: 10, answer: "2You might do this and that....", score: 0, idQuestion: 2)
    var answer3Q2 : Answer = Answer(id: 11, answer: "2You might do this and that....", score: 0, idQuestion: 2)
    
    var answerQ3: Answer = Answer(id: 12, answer: "3You could do this and that....", score: 0, idQuestion: 3)
    var answer1Q3 : Answer = Answer(id: 13, answer: "3You should do this and that....", score: 0, idQuestion: 3)
    var answer2Q3 : Answer = Answer(id: 14, answer: "3You might do this and that....", score: 0, idQuestion: 3)
    var answer3Q3 : Answer = Answer(id: 15, answer: "3You might do this and that....", score: 0, idQuestion: 3)
    
    var answerQ4: Answer = Answer(id: 16, answer: "4You could do this and that....", score: 0, idQuestion: 4)
    var answer1Q4 : Answer = Answer(id: 17, answer: "4You should do this and that....", score: 0, idQuestion: 4)
    var answer2Q4 : Answer = Answer(id: 18, answer: "4You might do this and that....", score: 0, idQuestion: 4)
    var answer3Q4 : Answer = Answer(id: 19, answer: "4You might do this and that....", score: 0, idQuestion: 4)
    
  //  Answers.add(answerTeste)
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //Adding questions to the singleton that represents a database
        Answers.shared.add(answer: answerQ0)
        Answers.shared.add(answer: answer1Q0)
        Answers.shared.add(answer: answer2Q0)
        Answers.shared.add(answer: answer3Q0)
        Answers.shared.add(answer: answerQ1)
        Answers.shared.add(answer: answer1Q1)
        Answers.shared.add(answer: answer2Q1)
        Answers.shared.add(answer: answer3Q1)
        Answers.shared.add(answer: answerQ2)
        Answers.shared.add(answer: answer1Q2)
        Answers.shared.add(answer: answer2Q2)
        Answers.shared.add(answer: answer3Q2)
        Answers.shared.add(answer: answerQ3)
        Answers.shared.add(answer: answer1Q3)
        Answers.shared.add(answer: answer2Q3)
        Answers.shared.add(answer: answer3Q3)
        Answers.shared.add(answer: answerQ4)
        Answers.shared.add(answer: answer1Q4)
        Answers.shared.add(answer: answer2Q4)
        Answers.shared.add(answer: answer3Q4)
    
        
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
        return Answers.shared.getByQuestionId(id: question.id).count
       // return Answers.sharedInstance.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersCell", for: indexPath) as! AnswersTableCell
        
//        var answersShowed = Answers.getById(id: question.id)
        cell.id = Answers.shared.getByQuestionId(id : question.id)[indexPath.row].id
       // cell.answer.text = answersShowed[indexPath.row].answer
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
