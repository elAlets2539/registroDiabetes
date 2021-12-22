//
//  Secc7_2.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc7_2: UIViewController {
    
    @IBOutlet weak var slider6: UISlider!
    @IBOutlet weak var slider7: UISlider!
    @IBOutlet weak var slider8: UISlider!
    @IBOutlet weak var slider9: UISlider!
    @IBOutlet weak var slider10: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func siguiente(_ sender: Any) {
        
        showAlert()
        
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc7_3") as? Secc7_3
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "¿Continuar?", message: "", preferredStyle: .alert)
        let noAceptarButton = UIAlertAction(title: "Cancelar", style: .default, handler: self.noOk)
        let aceptarButton = UIAlertAction(title: "Ok", style: .default, handler: self.ok)
        alert.addAction(noAceptarButton)
        alert.addAction(aceptarButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func noOk(alert: UIAlertAction!) {}
    
    func ok(alert: UIAlertAction!) {
        saveAnswers()
        print(CubetaDePreguntas.preguntasSecc7)
        nextView()
    }
    
    @IBAction func sld6(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld7(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld8(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld9(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld10(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    
    func getAnswer(elIndex: Int) -> String {
        
        switch elIndex {
        case 0:
            return "No"
        case 1:
            return "Poco"
        case 2:
            return "Bastante"
        case 3:
            return "Mucho"
        default:
            return "Ni Maiz"
        }
        
    }
    
    func saveAnswers() {
        
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider6.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider7.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider8.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider9.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider10.value)))
        
    }
    
}
