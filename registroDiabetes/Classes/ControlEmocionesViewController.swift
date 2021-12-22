//
//  ControlEmocionesViewController.swift
//  registroDiabetes
//
//  Created by DevLabs on 2/27/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ControlEmocionesViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var muyMalImage: UIImageView!
    @IBOutlet weak var malImage: UIImageView!
    @IBOutlet weak var medioImage: UIImageView!
    @IBOutlet weak var bienImage: UIImageView!
    @IBOutlet weak var muyBienImage: UIImageView!
    
    @IBOutlet weak var slider: UISlider!
    
    //@IBOutlet weak var insulinaTf: UITextField!
    @IBOutlet weak var insulinaTf: UITextField!
    
    var firebaseId = ""
    var emoCtrlNum = ""
    var emotionSelected = ""
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        insulinaTf.delegate = self
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func atras(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func muyMalPressed(_ sender: Any) {
        
        resetEmojis()
        muyMalImage.image = UIImage.init(imageLiteralResourceName: "cry")
        emotionSelected = "Muy mal"
        
    }
    
    @IBAction func malPressed(_ sender: Any) {
        
        resetEmojis()
        malImage.image = UIImage.init(imageLiteralResourceName: "confused")
        emotionSelected = "Mal"
        
    }
    
    @IBAction func medioPressed(_ sender: Any) {
        
        resetEmojis()
        medioImage.image = UIImage.init(imageLiteralResourceName: "neutral")
        emotionSelected = "Medio"
        
    }
    
    @IBAction func bienPressed(_ sender: Any) {
        
        resetEmojis()
        bienImage.image = UIImage.init(imageLiteralResourceName: "blush")
        emotionSelected = "Bien"
        
    }
    
    @IBAction func muyBienPressed(_ sender: Any) {
        
        resetEmojis()
        muyBienImage.image = UIImage.init(imageLiteralResourceName: "smile")
        emotionSelected = "Muy bien"
        
    }
    
    func resetEmojis() {
        
        muyMalImage.image = UIImage.init(imageLiteralResourceName: "muy mal")
        malImage.image = UIImage.init(imageLiteralResourceName: "mal")
        medioImage.image = UIImage.init(imageLiteralResourceName: "medio")
        bienImage.image = UIImage.init(imageLiteralResourceName: "bien")
        muyBienImage.image = UIImage.init(imageLiteralResourceName: "muy bien")
        
    }
    
    @IBAction func salvaguardar(_ sender: Any) {
        
        if allDataIsProvided() {
            saveToDatabase()
            dismiss(animated: true, completion: nil)
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
    
    func allDataIsProvided() -> Bool {
        
        /*if emotionSelected == "" && insulinaTf.text == "" {
            return false
        }
        return true*/
        
        if emotionSelected != "" && insulinaTf.text != "" {
            return true
        }
        return false
        
    }
    
    func saveToDatabase() {
        
        ref = Database.database().reference()
        
        let porcentajeDeFelicidad = slider.value
        
        let key = firebaseId
        let nuevoNum = Int(emoCtrlNum)! + 1
        let name = "emotionsControl" + String(nuevoNum)
        ref.child(key).child("emotionsControl").child(name).setValue(["emoticon":emotionSelected, "porcentaje":String(porcentajeDeFelicidad), "insulina":insulinaTf.text!])
        //ref.child(key).child("emotionsControl").setValue(["emoticon":"emotionSelected"])
        ref.child(key).updateChildValues(["numberOfEmotionsControlled":String(nuevoNum)])
        
    }
    
}
