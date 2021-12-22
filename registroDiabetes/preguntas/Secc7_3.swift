//
//  Secc7_3.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc7_3: UIViewController {
    
    @IBOutlet weak var slider11: UISlider!
    @IBOutlet weak var slider12: UISlider!
    @IBOutlet weak var slider13: UISlider!
    @IBOutlet weak var slider14: UISlider!
    @IBOutlet weak var slider15: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func siguiente(_ sender: Any) {
        
        showAlert()
        
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc7_4") as? Secc7_4
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
    
    @IBAction func sld11(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld12(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld13(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld14(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld15(_ sender: Any) {
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
        
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider11.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider12.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider13.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider14.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider15.value)))
        
    }
    
}
