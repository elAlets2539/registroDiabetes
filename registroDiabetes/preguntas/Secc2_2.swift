//
//  Secc2_2.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc2_2: UIViewController {
    
    @IBOutlet weak var sc10Outlet: UISegmentedControl!
    @IBOutlet weak var sc11Outlet: UISegmentedControl!
    @IBOutlet weak var sc12Outlet: UISegmentedControl!
    @IBOutlet weak var sc13Outlet: UISegmentedControl!
    @IBOutlet weak var sc14Outlet: UISegmentedControl!
    @IBOutlet weak var sc15Outlet: UISegmentedControl!
    @IBOutlet weak var sc16Outlet: UISegmentedControl!
    @IBOutlet weak var sc17Outlet: UISegmentedControl!
    @IBOutlet weak var sc18Outlet: UISegmentedControl!
    
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
    
    @IBAction func sc10(_ sender: Any) {
        preguntas[0] = 1
    }
    @IBAction func sc11(_ sender: Any) {
        preguntas[1] = 1
    }
    @IBAction func sc12(_ sender: Any) {
        preguntas[2] = 1
    }
    @IBAction func sc13(_ sender: Any) {
        preguntas[3] = 1
    }
    @IBAction func sc14(_ sender: Any) {
        preguntas[4] = 1
    }
    @IBAction func sc15(_ sender: Any) {
        preguntas[5] = 1
    }
    @IBAction func sc16(_ sender: Any) {
        preguntas[6] = 1
    }
    @IBAction func sc17(_ sender: Any) {
        preguntas[7] = 1
    }
    @IBAction func sc18(_ sender: Any) {
        preguntas[8] = 1
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc2_3") as? Secc2_3
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
        
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc10Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc11Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc12Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc13Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc14Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc15Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc16Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc17Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc18Outlet.selectedSegmentIndex))
        
    }
    
}
