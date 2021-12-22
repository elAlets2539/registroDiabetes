//
//  Secc1_5.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc1_5: UIViewController {
    
    @IBOutlet weak var sc49Outlet: UISegmentedControl!
    @IBOutlet weak var sc50Outlet: UISegmentedControl!
    @IBOutlet weak var sc51Outlet: UISegmentedControl!
    @IBOutlet weak var sc52Outlet: UISegmentedControl!
    @IBOutlet weak var sc53Outlet: UISegmentedControl!
    @IBOutlet weak var sc54Outlet: UISegmentedControl!
    @IBOutlet weak var sc55Outlet: UISegmentedControl!
    @IBOutlet weak var sc56Outlet: UISegmentedControl!
    @IBOutlet weak var sc57Outlet: UISegmentedControl!
    
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
    
    @IBAction func continuar(_ sender: Any) {
        
        if allQuestionsAreAnswered() {
            saveAnswers()
            print(CubetaDePreguntas.preguntasSecc1)
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
    
    @IBAction func sc49(_ sender: Any) {
        preguntas[0] = 1
    }
    @IBAction func sc50(_ sender: Any) {
        preguntas[1] = 1
    }
    @IBAction func sc51(_ sender: Any) {
        preguntas[2] = 1
    }
    @IBAction func sc52(_ sender: Any) {
        preguntas[3] = 1
    }
    @IBAction func sc53(_ sender: Any) {
        preguntas[4] = 1
    }
    @IBAction func sc54(_ sender: Any) {
        preguntas[5] = 1
    }
    @IBAction func sc55(_ sender: Any) {
        preguntas[6] = 1
    }
    @IBAction func sc56(_ sender: Any) {
        preguntas[7] = 1
    }
    @IBAction func sc57(_ sender: Any) {
        preguntas[8] = 1
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc2") as? Secc2
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
            return "Nada"
        case 1:
            return "Poco"
        case 2:
            return "Regular"
        case 3:
            return "Suficiente"
        case 4:
            return "Bastante"
        default:
            return "Ni Maiz"
        }
        
    }
    
    func saveAnswers() {
        
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc49Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc50Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc51Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc52Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc53Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc54Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc55Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc56Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc57Outlet.selectedSegmentIndex))
        
    }
    
}
