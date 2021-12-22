//
//  Secc3.swift
//  registroDiabetes
//
//  Created by DevLabs on 2/28/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc3_1: UIViewController {
    
    @IBOutlet weak var sc1Outlet: UISegmentedControl!
    @IBOutlet weak var sc2Outlet: UISegmentedControl!
    @IBOutlet weak var sc3Outlet: UISegmentedControl!
    @IBOutlet weak var sc4Outlet: UISegmentedControl!
    
    var preguntas: [Int] = []
    var numberOfQuestions = 4
    
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
            print(CubetaDePreguntas.preguntasSecc3)
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
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc3_2") as? Secc3_2
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
    
    func getRespuesta(scIndex: Int) -> String {
        
        switch scIndex {
        case 0:
            return "Muy en desacuerdo"
        case 1:
            return "En desacuerdo"
        case 2:
            return "Ni de acuerdo ni en desacuerdo"
        case 3:
            return "De acuerdo"
        case 4:
            return "Muy de acuerdo"
        default:
            return "Ni Maiz"
        }
        
    }
    
    func saveAnswers() {
        
        CubetaDePreguntas.preguntasSecc3.append(getRespuesta(scIndex: sc1Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc3.append(getRespuesta(scIndex: sc2Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc3.append(getRespuesta(scIndex: sc3Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc3.append(getRespuesta(scIndex: sc4Outlet.selectedSegmentIndex))
        
    }
    
}
