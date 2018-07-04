//
//  Profile.swift
//  AppFoundations
//
//  Created by Augusto César Aragão de Bulhões on 6/25/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import Foundation

class Profile:Codable {
    
    var id : Int
    var company : String
    var place : String
    var job : String
    var name: String
    var knowledge: [Knowledge]
    var comunities: [Comunity]
    
    init (id: Int, name: String, company: String, place: String, job: String, knowledge: [Knowledge]){
        self.id = id
        self.name = name
        self.company = company
        self.place = place
        self.job = job
        self.knowledge = knowledge
        self.comunities = []
    }
    
    enum Key:String {
        case id = "id"
        case name = "name"
        case company = "company"
        case place = "place"
        case ceo = "ceo"
        case knowledge = "knowledge"
        case comunities = "comunities"
    }
    
    func addComunity(comunity: Comunity)-> Void{
        self.comunities.append(comunity)
        comunity.counter()
    }
    
}
