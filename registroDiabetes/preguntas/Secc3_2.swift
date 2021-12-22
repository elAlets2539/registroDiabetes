//
//  Secc3_1.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/1/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc3_2: UIViewController {
    
    @IBOutlet weak var sc5Outlet: UISegmentedControl!
    @IBOutlet weak var sc6Outlet: UISegmentedControl!
    @IBOutlet weak var sc7Outlet: UISegmentedControl!
    @IBOutlet weak var sc8Outlet: UISegmentedControl!
    
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
    
    @IBAction func continuar(_ sender: Any) {

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
    
    @IBAction func sc5(_ sender: Any) {
        preguntas[0] = 1
    }
    @IBAction func sc6(_ sender: Any) {
        preguntas[1] = 1
    }
    @IBAction func sc7(_ sender: Any) {
        preguntas[2] = 1
    }
    @IBAction func sc8(_ sender: Any) {
        preguntas[3] = 1
    }
    

    func nextView() {
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc4") as? Secc4
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
        
        CubetaDePreguntas.preguntasSecc3.append(getRespuesta(scIndex: sc5Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc3.append(getRespuesta(scIndex: sc6Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc3.append(getRespuesta(scIndex: sc7Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc3.append(getRespuesta(scIndex: sc8Outlet.selectedSegmentIndex))
        
    }

}
