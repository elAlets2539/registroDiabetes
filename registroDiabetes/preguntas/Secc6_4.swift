//
//  Secc6_4.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc6_4: UIViewController {
    
    @IBOutlet weak var sc16Outlet: UISegmentedControl!
    @IBOutlet weak var sc17Outlet: UISegmentedControl!
    @IBOutlet weak var sc18Outlet: UISegmentedControl!
    @IBOutlet weak var sc19Outlet: UISegmentedControl!
    @IBOutlet weak var sc20Outlet: UISegmentedControl!
    
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
    
    @IBAction func continuar(_ sender: Any) {
        
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
    
    @IBAction func sc16(_ sender: Any) {
        preguntas[0] = 1
    }
    @IBAction func sc17(_ sender: Any) {
        preguntas[1] = 1
    }
    @IBAction func sc18(_ sender: Any) {
        preguntas[2] = 1
    }
    @IBAction func sc19(_ sender: Any) {
        preguntas[3] = 1
    }
    @IBAction func sc20(_ sender: Any) {
        preguntas[4] = 1
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc7") as? Secc7
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
        
        var pregunta16 = ""
        var pregunta17 = ""
        var pregunta18 = ""
        var pregunta19 = ""
        var pregunta20 = ""
        
        if sc16Outlet.selectedSegmentIndex == 0 {
            pregunta16 = "Nada"
        } else {
            pregunta16 = "Que es una salida"
        }
        if sc17Outlet.selectedSegmentIndex == 0 {
            pregunta17 = "Es muy grande"
        } else {
            pregunta17 = "Es nula"
        }
        if sc18Outlet.selectedSegmentIndex == 0 {
            pregunta18 = "En mis manos"
        } else {
            pregunta18 = "En factores externos"
        }
        if sc19Outlet.selectedSegmentIndex == 0 {
            pregunta19 = "Fuente de placer"
        } else {
            pregunta19 = "Experiencia aburrida"
        }
        if sc20Outlet.selectedSegmentIndex == 0 {
            pregunta20 = "No tengo propósito"
        } else {
            pregunta20 = "Tengo metas y sentido"
        }
        
        CubetaDePreguntas.preguntasSecc6.append(pregunta16)
        CubetaDePreguntas.preguntasSecc6.append(pregunta17)
        CubetaDePreguntas.preguntasSecc6.append(pregunta18)
        CubetaDePreguntas.preguntasSecc6.append(pregunta19)
        CubetaDePreguntas.preguntasSecc6.append(pregunta20)
        
    }
    
}
