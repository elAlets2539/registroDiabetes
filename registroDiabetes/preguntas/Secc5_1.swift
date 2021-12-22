//
//  Secc5_1.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc5_1: UIViewController {
    
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider4: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func siguiente(_ sender: Any) {
        
        showAlert()
        
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc5_2") as? Secc5_2
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
        print(CubetaDePreguntas.preguntasSecc5)
        nextView()
    }
    
    @IBAction func sld1(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld2(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld3(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld4(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    
    func getAnswer(elIndex: Int) -> String {
        
        switch elIndex {
        case 0:
            return "Nada"
        case 1:
            return "Poco"
        case 2:
            return "Algo"
        case 3:
            return "Bastante"
        case 4:
            return "Mucho"
        default:
            return "Ni Maiz"
        }
        
    }
    
    func saveAnswers() {
        
        CubetaDePreguntas.preguntasSecc5.append(getAnswer(elIndex: Int(slider1.value)))
        CubetaDePreguntas.preguntasSecc5.append(getAnswer(elIndex: Int(slider2.value)))
        CubetaDePreguntas.preguntasSecc5.append(getAnswer(elIndex: Int(slider3.value)))
        CubetaDePreguntas.preguntasSecc5.append(getAnswer(elIndex: Int(slider4.value)))
        
    }

}
