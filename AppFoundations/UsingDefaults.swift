//
//  UsingDefaults.swift
//  AppFoundations
//
//  Created by Augusto César Aragão de Bulhões on 6/27/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import Foundation

class UsingDefaults{
    
    var key:String
    var objType:Any
    
    init(){
        self.key = ""
        self.objType = NSNull.self
    }
    
    static func loadFromDefaults <T : Codable> (key:String, objType:T.Type) -> Any{
        var result:Any = ""
        if let savedFiles = UserDefaults.standard.object(forKey: key) as? Data{
            let decoder = JSONDecoder()
            if let loadedFiles = try? decoder.decode(objType, from: savedFiles){
                result = loadedFiles
            }
        }
        return result
    }
    
    static func saveToDefaults <T : Codable>(key:String, obj:T) -> Void{
        if let encodedFile = try? JSONEncoder().encode(obj){
            UserDefaults.standard.set(encodedFile, forKey: key)
        }
    }
    
}
