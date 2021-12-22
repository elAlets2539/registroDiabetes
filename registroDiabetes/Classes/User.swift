//
//  User.swift
//  registroDiabetes
//
//  Created by DevLabs on 2/25/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class User: NSObject {

    var name: String = ""
    var id: String = ""
    var photo: UIImage
    var age: String = ""
    var sex: String = ""
    var time: String = ""
    var firebaseId: String = ""
    var bool: String = ""
    var emoCtrlNum: String = ""
    
    init(nombre: String, aidi: String) {
        
        name = nombre
        id = aidi
        photo = UIImage.init(named: "add")!
        
    }
    
    //init(nombre: String, aidi: String, foto: UIImage, edad: Int, sexo: Int, tiempo: Int) {
    init(nombre: String, aidi: String, foto: UIImage, edad: String, sexo: String, tiempo: String, elFirebaseId: String, elBool: String, elEmoCtrlNum: String) {
        
        name = nombre
        id = aidi
        photo = foto
        age = edad
        sex = sexo
        time = tiempo
        firebaseId = elFirebaseId
        bool = elBool
        emoCtrlNum = elEmoCtrlNum
        
    }
    
}
