//
//  Secc1_4.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc1_4: UIViewController {
    
    @IBOutlet weak var sc37Outlet: UISegmentedControl!
    @IBOutlet weak var sc38Outlet: UISegmentedControl!
    @IBOutlet weak var sc39Outlet: UISegmentedControl!
    @IBOutlet weak var sc40Outlet: UISegmentedControl!
    @IBOutlet weak var sc41Outlet: UISegmentedControl!
    @IBOutlet weak var sc42Outlet: UISegmentedControl!
    @IBOutlet weak var sc43Outlet: UISegmentedControl!
    @IBOutlet weak var sc44Outlet: UISegmentedControl!
    @IBOutlet weak var sc45Outlet: UISegmentedControl!
    @IBOutlet weak var sc46Outlet: UISegmentedControl!
    @IBOutlet weak var sc47Outlet: UISegmentedControl!
    @IBOutlet weak var sc48Outlet: UISegmentedControl!
    
    var preguntas: [Int] = []
    var numberOfQuestions = 12
    
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
    
    @IBAction func sc37(_ sender: Any) {
        preguntas[0] = 1
    }
    @IBAction func sc38(_ sender: Any) {
        preguntas[1] = 1
    }
    @IBAction func sc39(_ sender: Any) {
        preguntas[2] = 1
    }
    @IBAction func sc40(_ sender: Any) {
        preguntas[3] = 1
    }
    @IBAction func sc41(_ sender: Any) {
        preguntas[4] = 1
    }
    @IBAction func sc42(_ sender: Any) {
        preguntas[5] = 1
    }
    @IBAction func sc43(_ sender: Any) {
        preguntas[6] = 1
    }
    @IBAction func sc44(_ sender: Any) {
        preguntas[7] = 1
    }
    @IBAction func sc45(_ sender: Any) {
        preguntas[8] = 1
    }
    @IBAction func sc46(_ sender: Any) {
        preguntas[9] = 1
    }
    @IBAction func sc47(_ sender: Any) {
        preguntas[10] = 1
    }
    @IBAction func sc48(_ sender: Any) {
        preguntas[11] = 1
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc1_5") as? Secc1_5
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
        
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc37Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc38Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc39Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc40Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc41Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc42Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc43Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc44Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc45Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc46Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc47Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc1.append(getRespuesta(scIndex: sc48Outlet.selectedSegmentIndex))
        
    }
    
}
