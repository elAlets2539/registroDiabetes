//
//  Secc4_6.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/1/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc4_6: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tf6: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tf6.delegate = self
        
    }
    
    @IBAction func siguiente(_ sender: Any) {
        
        if tf6.text != "" {
            saveAnswers()
            print(CubetaDePreguntas.preguntasSecc4_6)
            nextView()
        } else {
            showAlert()
        }
        
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Formulario incompleto", message: "Responda la pregunta para continuar", preferredStyle: .alert)
        let aceptarButton = UIAlertAction(title: "Ok", style: .default, handler: self.ok)
        alert.addAction(aceptarButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func ok(alert: UIAlertAction!) {}
    
    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc4_7") as? Secc4_7
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    func saveAnswers() {
        
        var juan = ""
        
        for palabra in tf6.text {
            
            if palabra != " " {
                juan += String(palabra)
            } else {
                CubetaDePreguntas.preguntasSecc4_6.append(juan)
                juan = ""
            }
            
        }
        
        CubetaDePreguntas.preguntasSecc4_6.append(juan)
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
