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
    
     var questions:[Question]  = [Question(id: 1, question: "Alguém que já participou do Startup Chile pode me ajudar com a proposta do programa?", questionDetails: "Nós somos a GostoFacil, temos uma solução para quem quer comer comida saudável no trabalho, vendemos para as empresas que querem melhorar a qualidade da alimen…"),
                 Question(id: 2, question: "Alguém sabe quando sai a próxima chamada do Startup Brasil?", questionDetails: "Estou aguardando a nova chamada desde o ano passado, acho que a última foi em outubro. Vocês sabem qual é a frequência dos editais?"),
                 Question(id: 3, question: "Como vocês escolhem um sócio pra começar uma startup? Ou trazer pra dentro da startup?", questionDetails: "Minha primeira startup se desfez porque eu e meu sócio tínhamos ideias muito diferentes de como atacar o mercado, o produto já tava pronto, conseguimos alguns c…"),
                 Question(id: 4, question: "Meu produto está pronto e rodando no cliente, mas ele pede muitas mudanças, devo focar em…", questionDetails: "Meu produto está pronto e rodando no cliente, mas ele pede muitas mudanças, devo focar em vender o que nós já temos pronto?"),
                 Question(id: 5, question: "Com quantos clientes se faz uma empresa de verdade?", questionDetails: "Meu saas já está rodando em três clientes, mas nenhum deles é pagante e já to a 6 meses buscando novos mas nada, será que cons…"),
                 Question(id: 6, question: "Como vocês avaliam desenvolvedores na hora da contratação?", questionDetails: "Estou precisando crescer o time de desenvolvimento e planejo contratar em torno de 20 devs nos próximos 3 meses. As startups que eu acompanho estão sempre com chamadas abertas, mas eu realmente preciso encher a casa rapidamente e da maneira mais acertada possível para evitar demissões! Alguém que já passou por isso pode me ajudar?"),
                 Question(id: 7, question: "Onde vocês buscam conteúdo sobre empreendedorismo?", questionDetails: "Geralmente eu procuro no Google por materiais, mas queria indicações de livros, sites e newsletters para me manter atualizado no dia a dia.")]
 //   var answers:[Answer] = []
    var answers:[Answer] = [Answer(id: 0, answer: "You could do this and that....", score: 0, idQuestion: 1),
                            Answer(id: 1, answer: "You should do this and that....", score: 0, idQuestion: 1),
                            Answer(id: 2, answer: "You might do this and that....", score: 0, idQuestion: 1),
                            Answer(id: 3, answer: "You might do this and that....", score: 0, idQuestion: 1),
                            Answer(id: 4, answer: "As chamadas são por ciclo de aceleração, Fernando. A próxima chamada sai em outubro para as aceleradoras interessadas se inscreverem e depois de uns dois meses, abre a chamada para as startups.", score: 0, idQuestion: 2),
                            Answer(id: 5, answer: "Fernando, as chamadas para startups saem no começo do próximo ano. Não sei como está o seu planejamento mas pode valer mais a pena pra ti procurar alguma aceleradora da sua região para não esperar tanto, tem vários programas parceiros surgindo com grandes empresas que pode fazer sentido pra você!", score: 0, idQuestion: 2),
                            Answer(id: 6, answer: "O Startup Brasil tem um calendário bem certinho, entra nesse link que tem todos os detalhes: http://www.startupbrasil.org.br/sobre_programa/", score: 0, idQuestion: 2),
                            Answer(id: 7, answer: "Tem um grupo no Facebook com o pessoal da organização que eles tão sempre mandando as novidades, agora vai sair muita coisa sobre a chamada atual, mas pelo menos tu não perde a chamada do próximo ano!", score: 0, idQuestion: 2),
                            Answer(id: 8, answer: "You could do this and that....", score: 0, idQuestion: 3),
                            Answer(id: 9, answer: "You should do this and that....", score: 0, idQuestion: 3),
                            Answer(id: 10, answer: "You might do this and that....", score: 0, idQuestion: 3),
                            Answer(id: 11, answer: "You might do this and that....", score: 0, idQuestion: 3),
                            Answer(id: 12, answer: "You could do this and that....", score: 0, idQuestion: 4),
                            Answer(id: 13, answer: "You should do this and that....", score: 0, idQuestion: 4),
                            Answer(id: 14, answer: "You might do this and that....", score: 0, idQuestion: 4),
                            Answer(id: 15, answer: "You might do this and that....", score: 0, idQuestion: 5),
                            Answer(id: 16, answer: "You could do this and that....", score: 0, idQuestion: 5),
                            Answer(id: 17, answer: "You should do this and that....", score: 0, idQuestion: 6),
                            Answer(id: 18, answer: "You might do this and that....", score: 0, idQuestion: 6),
                            Answer(id: 19, answer: "You might do this and that....", score: 0, idQuestion: 6)]
    
//    var knowledge:[Knowledge] = []
     var knowledge:[Knowledge] = [Knowledge(id: 1, name: "Marketing"),
                                 Knowledge(id: 2, name: "Financeiro"),
                                 Knowledge(id: 3, name: "Admnistração"),
                                 Knowledge(id: 4, name: "RH"),
                                 Knowledge(id: 5, name: "Estratégia"),
                                 Knowledge(id: 6, name: "Capital")]
    
     var profiles:[Profile] = []
 //   var comunities:[Comunity] = []
     var comunities:[Comunity] = [Comunity(id: 1, name: "Manguezal"),
                                 Comunity(id: 2, name: "Startup-RJ"),
                                 Comunity(id: 3, name: "Startup-PE"),
                                 Comunity(id: 4, name: "Startup Summit"),
                                 Comunity(id: 5, name: "Desafios Financeiros"),
                                 Comunity(id: 6, name: "CIN"),
                                 Comunity(id: 7, name: "Marketing Digital")]
    
    
    var start = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Ruche"
     //   self.navigationController?.navigationBar.topItem?.
        
    /*    if let savedQuestions = UsingDefaults.loadFromDefaults(key: "questions", objType: [Question].self) as? [Question]{
            questions = savedQuestions
        }
 */
        if Questions.shared.count == 0{
            for question in questions{
                Questions.shared.add(question: question)
            }
        }
        
        
        profiles = [Profile(id: 1, name: "Allan", company:"Foundations", place: "Recife", job:"CEO", knowledge: [knowledge[0], knowledge[1]]),
                    Profile(id: 2, name: "César", company:"Foundations", place: "Recife", job:"CEO",  knowledge: [knowledge[2], knowledge[4]]),
                    Profile(id: 3, name: "Gabriel", company:"Foundations", place: "Recife", job:"CEO",   knowledge: [knowledge[1], knowledge[3]]),
                    Profile(id: 4, name: "Marina", company:"Foundations", place: "Recife", job:"CEO", knowledge: [knowledge[5], knowledge[0]])]
        
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
        
        var loggedUser:Profile = profiles[0]
        if let savedUser = UsingDefaults.loadFromDefaults(key: "loggedUser", objType: Profile.self) as? Profile{
            loggedUser = savedUser
        }
        UsingDefaults.saveToDefaults(key: "loggedUser", obj: loggedUser)
 
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let savedQuestions = UsingDefaults.loadFromDefaults(key: "questions", objType: [Question].self) as? [Question]{
            questions = savedQuestions
        }
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
    //        print("Valor do index", index)
    //        print("tamanho do array", questions.count)
            answersViewController.question = questions[index]
        }
    }
    }

}
