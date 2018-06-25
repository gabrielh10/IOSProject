//
//  Answer.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/25/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import Foundation

public struct Answer {
    var id : Int
    var answer : String
    var score : Int
    var idQuestion : Int
    
    init (id : Int, answer: String, score: Int, idQuestion : Int ){
        self.id = id
        self.answer = answer
        self.score = score
        self.idQuestion = idQuestion
    }
    
    mutating func attScore(newScore:Int){
        score = newScore
    }
}
