//
//  Answers.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/25/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//
                            //verificar utilizacao de structs ou classes pra salvar as respostas de forma a permitir modificar o score
import Foundation

public struct Answers {
    static let sharedInstance = Answers()
    
    var list: [Answer] = []
    
    public var count: Int {
        return list.count
    }
    
    public mutating func add (answer:Answer){
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
    
/*    public func attScore (idAnswer:Int, newScore:Int){
    for el in Answers.sharedInstance.list{
        if(el.id == idAnswer){
            el.score = newScore
        }
    }
}
    */
 /*   public static func getById(id : Int) -> Answer{
        for el in list {
            if(el.id == id){
                return el
            }
        }
        
    }
   */
    }
