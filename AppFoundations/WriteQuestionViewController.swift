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
    
    var newQuestion = Question(id: 0, question: "", questionDetails: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onClick(_ sender: Any) {
        newQuestion = Question(id: Questions.shared.count+1, question: question.text!, questionDetails: questionDetails.text)
        Questions.shared.add(question: newQuestion)
        self.performSegue(withIdentifier: "SegueNewQuestionToAnswers", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueNewQuestionToAnswers"){
            let answersViewController = segue.destination as! AnswersViewController
            answersViewController.question = newQuestion
        }
    }
}
