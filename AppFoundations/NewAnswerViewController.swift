//
//  NewAnswerViewController.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/27/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class NewAnswerViewController: UIViewController {
    @IBOutlet weak var question: UILabel!
    var idQuestion = 0
    var question1 = ""
    var questionDetail1 = ""
    @IBOutlet weak var newAnswer: UITextView!
    @IBOutlet weak var questionDetail: UILabel!
    @IBAction func onClick(_ sender: Any) {
        var answer = Answer(id: Answers.shared.list.count+1, answer: newAnswer.text!, score: 0, idQuestion: idQuestion)
        Answers.shared.add(answer: answer)
        
        self.performSegue(withIdentifier: "SegueNewAnswerToAnswers", sender: self)
        
    }
    
/*    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueNewAnswerToAnswers"){
            let answersViewController = segue.destination as! AnswersViewController
            
        }
    }
  */
    override func viewDidLoad() {
        super.viewDidLoad()
        question.text = question1
        questionDetail.text = questionDetail1
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

}
