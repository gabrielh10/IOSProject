//
//  Question.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/20/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import Foundation

struct Question {
    var id : Int
    var question: String
    var questionDetails: String
    init (id: Int, question: String, questionDetails: String){
        self.id = id
        self.question = question
        self.questionDetails = questionDetails
    }
}
