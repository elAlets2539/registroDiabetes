//
//  Secc6_2.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc6_2: UIViewController {
    
    @IBOutlet weak var sc6Outlet: UISegmentedControl!
    @IBOutlet weak var sc7Outlet: UISegmentedControl!
    @IBOutlet weak var sc8Outlet: UISegmentedControl!
    @IBOutlet weak var sc9Outlet: UISegmentedControl!
    @IBOutlet weak var sc10Outlet: UISegmentedControl!
    
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
    
    @IBAction func sc6(_ sender: Any) {
        preguntas[0] = 1
    }
    @IBAction func sc7(_ sender: Any) {
        preguntas[1] = 1
    }
    @IBAction func sc8(_ sender: Any) {
        preguntas[2] = 1
    }
    @IBAction func sc9(_ sender: Any) {
        preguntas[3] = 1
    }
    @IBAction func sc10(_ sender: Any) {
        preguntas[4] = 1
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc6_3") as? Secc6_3
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
        
        var pregunta6 = ""
        var pregunta7 = ""
        var pregunta8 = ""
        var pregunta9 = ""
        var pregunta10 = ""
        
        if sc6Outlet.selectedSegmentIndex == 0 {
            pregunta6 = "No haber nacido"
        } else {
            pregunta6 = "Vivir una vida igual"
        }
        if sc7Outlet.selectedSegmentIndex == 0 {
            pregunta7 = "Ser productivo"
        } else {
            pregunta7 = "Vaguear para siempre"
        }
        if sc8Outlet.selectedSegmentIndex == 0 {
            pregunta8 = "En nada"
        } else {
            pregunta8 = "Para estar satisfecho"
        }
        if sc9Outlet.selectedSegmentIndex == 0 {
            pregunta9 = "Vacía"
        } else {
            pregunta9 = "Llena de cosas buenas"
        }
        if sc10Outlet.selectedSegmentIndex == 0 {
            pregunta10 = "Valió la pena"
        } else {
            pregunta10 = "No valió para nada"
        }
        
        CubetaDePreguntas.preguntasSecc6.append(pregunta6)
        CubetaDePreguntas.preguntasSecc6.append(pregunta7)
        CubetaDePreguntas.preguntasSecc6.append(pregunta8)
        CubetaDePreguntas.preguntasSecc6.append(pregunta9)
        CubetaDePreguntas.preguntasSecc6.append(pregunta10)
        
    }
    
}
