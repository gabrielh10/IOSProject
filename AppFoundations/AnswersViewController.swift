//
//  AnswersViewController.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/21/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class AnswersViewController: UIViewController {
   
    @IBOutlet weak var questionSelected: UILabel!
    @IBOutlet weak var questionDetailsSelected: UILabel!
    
    var question : Question = Question(id: 0, question: "", questionDetails: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionSelected.text = question.question
        questionDetailsSelected.text = question.questionDetails
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
