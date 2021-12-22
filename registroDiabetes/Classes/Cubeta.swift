//
//  Cubeta.swift
//  registroDiabetes
//
//  Created by DevLabs on 2/25/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Cubeta: NSObject {

    static var usersArray: [User] = []
    
    class func addUser(elName: String, elId: String) {
        
        let elUser = User.init(nombre: elName, aidi: elId)
        
        Cubeta.usersArray.append(elUser)
        
    }
    
    class func addUser(elName: String, elId: String, laFoto: UIImage, laAge: String, elSex: String, elTime: String, elFirebaseId: String, elBoolean: String, elEmoCtrlNumero: String) {
        
        let elUser = User.init(nombre: elName, aidi: elId, foto: laFoto, edad: laAge, sexo: elSex, tiempo: elTime, elFirebaseId: elFirebaseId, elBool: elBoolean, elEmoCtrlNum: elEmoCtrlNumero)
        
        Cubeta.usersArray.append(elUser)
        
    }
    
    class func removeUser(elIndex: Int) {
        
        Cubeta.usersArray.remove(at: elIndex)
        
    }
    
    class func removeUser(elId: String) {
        
        var found = false
        var donde = 0
        
        while !found {
            
            if Cubeta.usersArray[donde].id == elId {
                
                found = true
                
            } else {
                donde += 1
            }
            
        }
        
        Cubeta.usersArray.remove(at: donde)
        
    }
    
}
