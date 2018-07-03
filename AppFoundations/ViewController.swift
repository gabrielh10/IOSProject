//
//  ViewController.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/20/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
  /*  @IBAction func reload(_ sender: Any) {
        myTableView.reloadData()
    }
   */
    @IBOutlet weak var myTableView: UITableView!
    
   // var questions:[Question] = []
    
     var questions:[Question]  = [Question(id: 1, question: "1How i do something ?", questionDetails: "Consider that i already try doing this like... "),
                 Question(id: 2, question: "2How i do something ?", questionDetails: "Consider that i already try... "),
                 Question(id: 3, question: "3How i do something ?", questionDetails: "Consider that i already try... "),
                 Question(id: 4, question: "4How i do something ?", questionDetails: "Consider that i already try... "),
                 Question(id: 5, question: "5How i do something ?", questionDetails: "Consider that i already try... "),
                 Question(id: 6, question: "6How i do something ?", questionDetails: "Consider that i already try... "),
                 Question(id: 7, question: "7How i do something ?", questionDetails: "Consider that i already try... ")]
 //   var answers:[Answer] = []
    var answers:[Answer] = [Answer(id: 0, answer: "0You could do this and that....", score: 0, idQuestion: 1),
                            Answer(id: 1, answer: "0You should do this and that....", score: 0, idQuestion: 1),
                            Answer(id: 2, answer: "0You might do this and that....", score: 0, idQuestion: 1),
                            Answer(id: 3, answer: "0You might do this and that....", score: 0, idQuestion: 1),
                            Answer(id: 4, answer: "1You could do this and that....", score: 0, idQuestion: 2),
                            Answer(id: 5, answer: "1You should do this and that....", score: 0, idQuestion: 2),
                            Answer(id: 6, answer: "1You might do this and that....", score: 0, idQuestion: 2),
                            Answer(id: 7, answer: "1You might do this and that....", score: 0, idQuestion: 2),
                            Answer(id: 8, answer: "2You could do this and that....", score: 0, idQuestion: 3),
                            Answer(id: 9, answer: "2You should do this and that....", score: 0, idQuestion: 3),
                            Answer(id: 10, answer: "2You might do this and that....", score: 0, idQuestion: 3),
                            Answer(id: 11, answer: "2You might do this and that....", score: 0, idQuestion: 3),
                            Answer(id: 12, answer: "3You could do this and that....", score: 0, idQuestion: 4),
                            Answer(id: 13, answer: "3You should do this and that....", score: 0, idQuestion: 4),
                            Answer(id: 14, answer: "3You might do this and that....", score: 0, idQuestion: 4),
                            Answer(id: 15, answer: "3You might do this and that....", score: 0, idQuestion: 5),
                            Answer(id: 16, answer: "4You could do this and that....", score: 0, idQuestion: 5),
                            Answer(id: 17, answer: "4You should do this and that....", score: 0, idQuestion: 6),
                            Answer(id: 18, answer: "4You might do this and that....", score: 0, idQuestion: 6),
                            Answer(id: 19, answer: "4You might do this and that....", score: 0, idQuestion: 6)]
    
//    var knowledge:[Knowledge] = []
     var knowledge:[Knowledge] = [Knowledge(id: 1, name: "Marketing"),
                                 Knowledge(id: 2, name: "Financeiro"),
                                 Knowledge(id: 3, name: "Admnistração"),
                                 Knowledge(id: 4, name: "RH"),
                                 Knowledge(id: 5, name: "Estratégia"),
                                 Knowledge(id: 6, name: "Capital")]
    
     var profiles:[Profile] = []
 //   var comunities:[Comunity] = []
     var comunities:[Comunity] = [Comunity(id: 1, name: "Foundations"),
                                 Comunity(id: 2, name: "CIN"),
                                 Comunity(id: 3, name: "UFPE")]
    
    var start = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Ruche"
  //      self.navigationController?.navigationBar.a
        
        if let savedQuestions = UsingDefaults.loadFromDefaults(key: "questions", objType: [Question].self) as? [Question]{
            questions = savedQuestions
        }
        
        if Questions.shared.count == 0{
            for question in questions{
                Questions.shared.add(question: question)
            }
        }
        
        
        profiles = [Profile(id: 1, name: "Allan", knowledge: [knowledge[0], knowledge[1]]),
                    Profile(id: 2, name: "César", knowledge: [knowledge[2], knowledge[4]]),
                    Profile(id: 3, name: "Gabriel", knowledge: [knowledge[1], knowledge[3]]),
                    Profile(id: 4, name: "Marina", knowledge: [knowledge[5], knowledge[0]])]
        
        profiles[0].addComunity(comunity: comunities[0])
        profiles[0].addComunity(comunity: comunities[1])
        profiles[1].addComunity(comunity: comunities[0])
        profiles[1].addComunity(comunity: comunities[1])
        profiles[2].addComunity(comunity: comunities[1])
        profiles[3].addComunity(comunity: comunities[0])
        profiles[3].addComunity(comunity: comunities[1])
        profiles[3].addComunity(comunity: comunities[2])
        
        
        UsingDefaults.saveToDefaults(key: "questions", obj: questions)
        
        if let savedAnswers = UsingDefaults.loadFromDefaults(key: "answers", objType: [Answer].self) as? [Answer]{
            answers = savedAnswers
        }
        UsingDefaults.saveToDefaults(key: "answers", obj: answers)
        
        if let savedKnowledge = UsingDefaults.loadFromDefaults(key: "knowledge", objType: [Knowledge].self) as? [Knowledge]{
            knowledge = savedKnowledge
        }
        UsingDefaults.saveToDefaults(key: "knowledge", obj: knowledge)
        
        if let savedComunities = UsingDefaults.loadFromDefaults(key: "comunities", objType: [Comunity].self) as? [Comunity]{
            comunities = savedComunities
        }
        UsingDefaults.saveToDefaults(key: "comunities", obj: comunities)
        
        if let savedProfiles = UsingDefaults.loadFromDefaults(key: "profiles", objType: [Profile].self) as? [Profile]{
            profiles = savedProfiles
        }
        UsingDefaults.saveToDefaults(key: "profiles", obj: profiles)
        
/*        var loggedUser:Profile = profiles[0]
        if let savedUser = UsingDefaults.loadFromDefaults(key: "loggedUser", objType: Profile.self) as? Profile{
            loggedUser = savedUser
        }
        UsingDefaults.saveToDefaults(key: "loggedUser", obj: loggedUser)
  */
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       myTableView.reloadData()
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
    @IBAction func onClickButton(_ sender: Any) {
        performSegue(withIdentifier: "SegueToWriteQuestion", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
    if(segue.identifier == "segueToAnswers"){
        let answersViewController = segue.destination as! AnswersViewController
        
        if let index = self.myTableView.indexPathForSelectedRow?.row{
        // set a variable in the second view controller with the data to pass
            answersViewController.question = questions[index]
        }
    }
    }

}
