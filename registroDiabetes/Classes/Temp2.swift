//
//  Temp2.swift
//  registroDiabetes
//
//  Created by Rafael López on 3/12/19.
//  Copyright © 2019 Rafael López. All rights reserved.
//

import UIKit

class Temp2: NSObject {

    static var preguntasSecc1: [String] = []
    static var preguntasSecc2: [String] = []
    static var preguntasSecc3: [String] = []
    static var preguntasSecc4_1: [String] = []
    static var preguntasSecc4_2: [String] = []
    static var preguntasSecc4_3: [String] = []
    static var preguntasSecc4_4: [String] = []
    static var preguntasSecc4_5: [String] = []
    static var preguntasSecc4_6: [String] = []
    static var preguntasSecc4_7: [String] = []
    static var preguntasSecc5: [String] = []
    static var preguntasSecc6: [String] = []
    static var preguntasSecc7: [String] = []
    
    class func eraseAllPreguntasArrays() {
        
        CubetaDePreguntas.preguntasSecc1.removeAll()
        CubetaDePreguntas.preguntasSecc2.removeAll()
        CubetaDePreguntas.preguntasSecc3.removeAll()
        CubetaDePreguntas.preguntasSecc4_1.removeAll()
        CubetaDePreguntas.preguntasSecc4_2.removeAll()
        CubetaDePreguntas.preguntasSecc4_3.removeAll()
        CubetaDePreguntas.preguntasSecc4_4.removeAll()
        CubetaDePreguntas.preguntasSecc4_5.removeAll()
        CubetaDePreguntas.preguntasSecc4_6.removeAll()
        CubetaDePreguntas.preguntasSecc4_7.removeAll()
        CubetaDePreguntas.preguntasSecc5.removeAll()
        CubetaDePreguntas.preguntasSecc6.removeAll()
        CubetaDePreguntas.preguntasSecc7.removeAll()
        
    }
    
}
