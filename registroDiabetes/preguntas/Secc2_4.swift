//
//  Secc2_4.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc2_4: UIViewController {
    
    @IBOutlet weak var sc29Outlet: UISegmentedControl!
    @IBOutlet weak var sc30Outlet: UISegmentedControl!
    @IBOutlet weak var sc31Outlet: UISegmentedControl!
    @IBOutlet weak var sc32Outlet: UISegmentedControl!
    @IBOutlet weak var sc33Outlet: UISegmentedControl!
    @IBOutlet weak var sc34Outlet: UISegmentedControl!
    @IBOutlet weak var sc35Outlet: UISegmentedControl!
    @IBOutlet weak var sc36Outlet: UISegmentedControl!
    @IBOutlet weak var sc37Outlet: UISegmentedControl!
    @IBOutlet weak var sc38Outlet: UISegmentedControl!
    
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
    
    @IBAction func continuar(_ sender: Any) {
        
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
    
    @IBAction func sc29(_ sender: Any) {
        preguntas[0] = 1
    }
    @IBAction func sc30(_ sender: Any) {
        preguntas[1] = 1
    }
    @IBAction func sc31(_ sender: Any) {
        preguntas[2] = 1
    }
    @IBAction func sc32(_ sender: Any) {
        preguntas[3] = 1
    }
    @IBAction func sc33(_ sender: Any) {
        preguntas[4] = 1
    }
    @IBAction func sc34(_ sender: Any) {
        preguntas[5] = 1
    }
    @IBAction func sc35(_ sender: Any) {
        preguntas[6] = 1
    }
    @IBAction func sc36(_ sender: Any) {
        preguntas[7] = 1
    }
    @IBAction func sc37(_ sender: Any) {
        preguntas[8] = 1
    }
    @IBAction func sc38(_ sender: Any) {
        preguntas[9] = 1
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc3") as? Secc3
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
        
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc29Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc30Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc31Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc32Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc33Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc34Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc35Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc36Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc37Outlet.selectedSegmentIndex))
        CubetaDePreguntas.preguntasSecc2.append(getRespuesta(scIndex: sc38Outlet.selectedSegmentIndex))
        
    }
    
}
