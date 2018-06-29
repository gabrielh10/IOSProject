//
//  Knowledge.swift
//  AppFoundations
//
//  Created by Augusto César Aragão de Bulhões on 6/25/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import Foundation

class Knowledge:Codable {
    
    var id : Int
    var name: String
    
    init (id: Int, name: String){
        self.id = id
        self.name = name
    }
}
