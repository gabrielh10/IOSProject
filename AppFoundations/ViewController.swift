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
    
    var exQuestion = Question(id: 1, question: "How i do something ?", questionDetails: "Consider that i already try... ")
    var exQuestion1 = Question(id: 2, question: "How i do something ?", questionDetails: "Consider that i already try... ")
    var exQuestion2 = Question(id: 3, question: "How i do something ?", questionDetails: "Consider that i already try... ")
    var exQuestion3 = Question(id: 4, question: "How i do something ?", questionDetails: "Consider that i already try... ")
    var exQuestion4 = Question(id: 5, question: "How i do something ?", questionDetails: "Consider that i already try... ")
    
    lazy var questions : [Question] = [exQuestion, exQuestion1, exQuestion2, exQuestion3, exQuestion4]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableCell
        
        cell.question.text = questions[indexPath.row].question
        cell.questionDetails.text = questions[indexPath.row].questionDetails
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

