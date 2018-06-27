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
}
