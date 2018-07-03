//
//  WriteQustionViewController.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/26/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class WriteQuestionViewController: UIViewController{

    @IBOutlet weak var questionDetails: UITextView!
    @IBOutlet weak var question: UITextField!
    var questions:[Question] = []
    var newQuestion = Question(id: 0, question: "", questionDetails: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClick(_ sender: Any) {
        if let savedQuestions = UsingDefaults.loadFromDefaults(key: "questions", objType: [Question].self) as? [Question]{
            questions = savedQuestions
        }
        
        newQuestion = Question(id: Questions.shared.count+1, question: question.text!, questionDetails: questionDetails.text)
        Questions.shared.add(question: newQuestion)
 //       self.performSegue(withIdentifier: "SegueNewQuestionToAnswers", sender: self)
        
        questions.append(newQuestion)
        UsingDefaults.saveToDefaults(key: "questions", obj: questions)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueNewQuestionToAnswers"){
            let answersViewController = segue.destination as! AnswersViewController
            answersViewController.question = newQuestion
        }
    }
}
