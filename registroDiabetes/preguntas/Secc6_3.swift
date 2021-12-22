//
//  Secc6_3.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc6_3: UIViewController {
    
    @IBOutlet weak var sc11Outlet: UISegmentedControl!
    @IBOutlet weak var sc12Outlet: UISegmentedControl!
    @IBOutlet weak var sc13Outlet: UISegmentedControl!
    @IBOutlet weak var sc14Outlet: UISegmentedControl!
    @IBOutlet weak var sc15Outlet: UISegmentedControl!
    
    var preguntas: [Int] = []
    var numberOfQuestions = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeArray()
        
    }
    
    func initializeArray() {
        
        for _ in 0..<numberOfQuestions {
            preguntas.append(0)
        }
        
    }
    
    @IBAction func siguiente(_ sender: Any) {
        
        if allQuestionsAreAnswered() {
            saveAnswers()
            print(CubetaDePreguntas.preguntasSecc6)
            nextView()
        } else {
            showAlert()
        }
        
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Formulario incompleto", message: "Responda todas las preguntas para continuar", preferredStyle: .alert)
        let aceptarButton = UIAlertAction(title: "Ok", style: .default, handler: self.ok)
        alert.addAction(aceptarButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func ok(alert: UIAlertAction!) {}
    
    @IBAction func sc11(_ sender: Any) {
        preguntas[0] = 1
    }
    @IBAction func sc12(_ sender: Any) {
        preguntas[1] = 1
    }
    @IBAction func sc13(_ sender: Any) {
        preguntas[2] = 1
    }
    @IBAction func sc14(_ sender: Any) {
        preguntas[3] = 1
    }
    @IBAction func sc15(_ sender: Any) {
        preguntas[4] = 1
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc6_4") as? Secc6_4
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    func allQuestionsAreAnswered() -> Bool {
        
        for index in 0..<numberOfQuestions {
            if preguntas[index] == 0 {
                return false
            }
        }
        return true
        
    }
    
    func saveAnswers() {
        
        var pregunta11 = ""
        var pregunta12 = ""
        var pregunta13 = ""
        var pregunta14 = ""
        var pregunta15 = ""
        
        if sc11Outlet.selectedSegmentIndex == 0 {
            pregunta11 = "¿Por qué existo?"
        } else {
            pregunta11 = "Veo propósito"
        }
        if sc12Outlet.selectedSegmentIndex == 0 {
            pregunta12 = "Me confunde"
        } else {
            pregunta12 = "Tiene significado"
        }
        if sc13Outlet.selectedSegmentIndex == 0 {
            pregunta13 = "Poco responsable"
        } else {
            pregunta13 = "Metas bien definidas"
        }
        if sc14Outlet.selectedSegmentIndex == 0 {
            pregunta14 = "Libre para elegir"
        } else {
            pregunta14 = "Limitado por herencia"
        }
        if sc15Outlet.selectedSegmentIndex == 0 {
            pregunta15 = "Estoy preparado"
        } else {
            pregunta15 = "No estoy preparado"
        }
        
        CubetaDePreguntas.preguntasSecc6.append(pregunta11)
        CubetaDePreguntas.preguntasSecc6.append(pregunta12)
        CubetaDePreguntas.preguntasSecc6.append(pregunta13)
        CubetaDePreguntas.preguntasSecc6.append(pregunta14)
        CubetaDePreguntas.preguntasSecc6.append(pregunta15)
        
    }
    
}
