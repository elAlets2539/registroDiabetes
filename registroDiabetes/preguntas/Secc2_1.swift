//
//  Secc2.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/1/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc2_1: UIViewController {
    
    @IBOutlet weak var sc1Outlet: UISegmentedControl!
    @IBOutlet weak var sc2Outlet: UISegmentedControl!
    @IBOutlet weak var sc3Outlet: UISegmentedControl!
    @IBOutlet weak var sc4Outlet: UISegmentedControl!
    @IBOutlet weak var sc5Outlet: UISegmentedControl!
    @IBOutlet weak var sc6Outlet: UISegmentedControl!
    @IBOutlet weak var sc7Outlet: UISegmentedControl!
    @IBOutlet weak var sc8Outlet: UISegmentedControl!
    @IBOutlet weak var sc9Outlet: UISegmentedControl!
    
    var preguntas: [Int] = []
    var numberOfQuestions = 9
    
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
            print(CubetaDePreguntas.preguntasSecc2)
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
    @IBAction func sc6(_ sender: Any) {
        preguntas[5] = 1
    }
    @IBAction func sc7(_ sender: Any) {
        preguntas[6] = 1
    }
    @IBAction func sc8(_ sender: Any) {
        preguntas[7] = 1
    }
    @IBAction func sc9(_ sender: Any) {
        preguntas[8] = 1
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc2_2") as? Secc2_2
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
            return "Nunca"
        case 1:
            return "Pocas veces"
        case 2:
            return "A veces"
        case 3:
            return "Casi siempre"
        case 4:
            return "Siempre"
        default:
            return "Ni Maiz"
        }
        
    }
    
    func saveAnswers() {
        
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc1Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc2Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc3Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc4Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc5Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc6Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc7Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc8Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc9Outlet.selectedSegmentIndex))
        
    }
    
}
