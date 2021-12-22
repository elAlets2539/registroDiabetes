//
//  Secc2_3.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc2_3: UIViewController {
    
    @IBOutlet weak var sc19Outlet: UISegmentedControl!
    @IBOutlet weak var sc20Outlet: UISegmentedControl!
    @IBOutlet weak var sc21Outlet: UISegmentedControl!
    @IBOutlet weak var sc22Outlet: UISegmentedControl!
    @IBOutlet weak var sc23Outlet: UISegmentedControl!
    @IBOutlet weak var sc24Outlet: UISegmentedControl!
    @IBOutlet weak var sc25Outlet: UISegmentedControl!
    @IBOutlet weak var sc26Outlet: UISegmentedControl!
    @IBOutlet weak var sc27Outlet: UISegmentedControl!
    @IBOutlet weak var sc28Outlet: UISegmentedControl!
    
    var preguntas: [Int] = []
    var numberOfQuestions = 10
    
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
    
    @IBAction func sc19(_ sender: Any) {
        preguntas[0] = 1
    }
    @IBAction func sc20(_ sender: Any) {
        preguntas[1] = 1
    }
    @IBAction func sc21(_ sender: Any) {
        preguntas[2] = 1
    }
    @IBAction func sc22(_ sender: Any) {
        preguntas[3] = 1
    }
    @IBAction func sc23(_ sender: Any) {
        preguntas[4] = 1
    }
    @IBAction func sc24(_ sender: Any) {
        preguntas[5] = 1
    }
    @IBAction func sc25(_ sender: Any) {
        preguntas[6] = 1
    }
    @IBAction func sc26(_ sender: Any) {
        preguntas[7] = 1
    }
    @IBAction func sc27(_ sender: Any) {
        preguntas[8] = 1
    }
    @IBAction func sc28(_ sender: Any) {
        preguntas[9] = 1
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc2_4") as? Secc2_4
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
        
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc19Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc20Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc21Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc22Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc23Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc24Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc25Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc26Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc27Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc28Outlet.selectedSegmentIndex))
    
    }
    
}
