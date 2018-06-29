//
//  Comunity.swift
//  AppFoundations
//
//  Created by Augusto César Aragão de Bulhões on 6/25/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import Foundation

class Comunity:Codable {
    var id : Int
    var name: String
    var quantity: Int
    
    init (id: Int, name: String){
        self.id = id
        self.name = name
        self.quantity = 0
    }
    
    enum Key:String {
        case id = "id"
        case name = "name"
        case quantity = "quantity"
    }
    
    func counter() -> Void{
        self.quantity += 1
        
    }
}
