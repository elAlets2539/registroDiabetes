//
//  Secc6_1.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc6_1: UIViewController {
    
    @IBOutlet weak var sc1Outlet: UISegmentedControl!
    @IBOutlet weak var sc2Outlet: UISegmentedControl!
    @IBOutlet weak var sc3Outlet: UISegmentedControl!
    @IBOutlet weak var sc4Outlet: UISegmentedControl!
    @IBOutlet weak var sc5Outlet: UISegmentedControl!
    
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

    @IBAction func sc1(_ sender: Any) {
        preguntas[0] = 1
    }
    @IBAction func sc2(_ sender: Any) {
        preguntas[1] = 1
    }
    @IBAction func sc3(_ sender: Any) {
        preguntas[2] = 1
    }
    @IBAction func sc4(_ sender: Any) {
        preguntas[3] = 1
    }
    @IBAction func sc5(_ sender: Any) {
        preguntas[4] = 1
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc6_2") as? Secc6_2
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
        
        var pregunta1 = ""
        var pregunta2 = ""
        var pregunta3 = ""
        var pregunta4 = ""
        var pregunta5 = ""
        
        if sc1Outlet.selectedSegmentIndex == 0 {
            pregunta1 = "Totalmente aburrido"
        } else {
            pregunta1 = "Entusiasmado"
        }
        if sc2Outlet.selectedSegmentIndex == 0 {
            pregunta2 = "Emocionante"
        } else {
            pregunta2 = "Rutinaria"
        }
        if sc3Outlet.selectedSegmentIndex == 0 {
            pregunta3 = "Ninguna meta fija"
        } else {
            pregunta3 = "Metas bien definidas"
        }
        if sc4Outlet.selectedSegmentIndex == 0 {
            pregunta4 = "Nada de significado"
        } else {
            pregunta4 = "Mucho significado"
        }
        if sc5Outlet.selectedSegmentIndex == 0 {
            pregunta5 = "Contínuamente nuevo"
        } else {
            pregunta5 = "Idéntico al anterior"
        }
        
        CubetaDePreguntas.preguntasSecc6.append(pregunta1)
        CubetaDePreguntas.preguntasSecc6.append(pregunta2)
        CubetaDePreguntas.preguntasSecc6.append(pregunta3)
        CubetaDePreguntas.preguntasSecc6.append(pregunta4)
        CubetaDePreguntas.preguntasSecc6.append(pregunta5)
        
    }
    
}
