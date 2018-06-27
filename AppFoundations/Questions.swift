//
//  Questions.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/27/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import Foundation

final class Questions {
    private init(){}
    
    static let shared = Questions()
    
    var list: [Question] = []
    
    public var count : Int {
        return list.count
    }
    
    public func add (question:Question){
        list.append(question)
    }
    
    public func getQuestionByID (idQuestion : Int) -> Question?{
        for el in Questions.shared.list{
            if(el.id == idQuestion){
                return el
            }
        }
        return nil
    }
}
