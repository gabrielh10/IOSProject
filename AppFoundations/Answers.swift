//
//  Answers.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/25/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//
                            //verificar utilizacao de structs ou classes pra salvar as respostas de forma a permitir modificar o score
import Foundation

final class Answers: Codable {
    
    private init(){}
    
    static let shared = Answers()
    
    var list: [Answer] = []
    
    public var count: Int {
        return list.count
    }
    
    public func add (answer:Answer){
        list.append(answer)
    }
    public func getByQuestionId (id : Int) -> [Answer]{
        var listOfAnswers : [Answer] = []
        for el in list {
            if(el.idQuestion == id){
                listOfAnswers.append(el)
            }
        }
        return listOfAnswers
    }
 
    public func attScore (idAnswer:Int, newScore:Int){
        for el in Answers.shared.list{
            if(el.id == idAnswer){
                el.attScore(newScore: newScore)
        }
    }
}
    public func getScoreByID(idAnswer:Int) -> Int{
        for el in Answers.shared.list{
            if(el.id == idAnswer){
                return el.score
            }
        }
        return 0
    }
  
    public static func getById(id : Int) -> Answer?{
        for el in Answers.shared.list {
            if(el.id == id){
                return el
            }
        }
        return nil
    }
    }
