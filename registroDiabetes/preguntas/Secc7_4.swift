//
//  Secc7_4.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/2/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Secc7_4: UIViewController {
    
    @IBOutlet weak var slider16: UISlider!
    @IBOutlet weak var slider17: UISlider!
    @IBOutlet weak var slider18: UISlider!
    @IBOutlet weak var slider19: UISlider!
    @IBOutlet weak var slider20: UISlider!
    @IBOutlet weak var slider21: UISlider!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finalizar(_ sender: Any) {
        
        showAlert()
        
    }
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController
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
        saveToDatabase()
        CubetaDePreguntas.eraseAllPreguntasArrays()
        nextView()
    }
    
    @IBAction func sld16(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld17(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld18(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld19(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld20(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value/1.0)*1.0
        (sender as AnyObject).setValue(fixed, animated: true)
    }
    @IBAction func sld21(_ sender: Any) {
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
        
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider16.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider17.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider18.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider19.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider20.value)))
        CubetaDePreguntas.preguntasSecc7.append(getAnswer(elIndex: Int(slider21.value)))
        
    }
    
    func saveToDatabase() {
        
        ref = Database.database().reference()
        let key = CubetaDePreguntas.firebaseId
        let bool = CubetaDePreguntas.bool
        
        if bool == "false" {
            ref.child(key).child("questionsBefore").setValue(["secc1":CubetaDePreguntas.preguntasSecc1, "secc2":CubetaDePreguntas.preguntasSecc2, "secc3":CubetaDePreguntas.preguntasSecc3, "secc5":CubetaDePreguntas.preguntasSecc5, "secc6":CubetaDePreguntas.preguntasSecc6, "secc7":CubetaDePreguntas.preguntasSecc7])
            ref.child(key).child("questionsBefore").child("secc4").setValue(["pregunta1":CubetaDePreguntas.preguntasSecc4_1, "pregunta2":CubetaDePreguntas.preguntasSecc4_2, "pregunta3":CubetaDePreguntas.preguntasSecc4_3, "pregunta4":CubetaDePreguntas.preguntasSecc4_4, "pregunta5":CubetaDePreguntas.preguntasSecc4_5, "pregunta6":CubetaDePreguntas.preguntasSecc4_6, "preguntaExtra":CubetaDePreguntas.preguntasSecc4_7])
            ref.child(key).updateChildValues(["bool":"true"])
        } else if bool == "true" {
            ref.child(key).child("questionsAfter").setValue(["secc1":CubetaDePreguntas.preguntasSecc1, "secc2":CubetaDePreguntas.preguntasSecc2, "secc3":CubetaDePreguntas.preguntasSecc3, "secc5":CubetaDePreguntas.preguntasSecc5, "secc6":CubetaDePreguntas.preguntasSecc6, "secc7":CubetaDePreguntas.preguntasSecc7])
            ref.child(key).child("questionsAfter").child("secc4").setValue(["pregunta1":CubetaDePreguntas.preguntasSecc4_1, "pregunta2":CubetaDePreguntas.preguntasSecc4_2, "pregunta3":CubetaDePreguntas.preguntasSecc4_3, "pregunta4":CubetaDePreguntas.preguntasSecc4_4, "pregunta5":CubetaDePreguntas.preguntasSecc4_5, "pregunta6":CubetaDePreguntas.preguntasSecc4_6, "preguntaExtra":CubetaDePreguntas.preguntasSecc4_7])
            ref.child(key).updateChildValues(["bool":"supertrue"])
        }
        
    }
    
}
