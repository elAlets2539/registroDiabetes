//
//  Secc4_7.swift
//  registroDiabetes
//
//  Created by DevLabs on 3/1/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class Secc4_7: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tfExtra: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tfExtra.delegate = self
        
    }

    func nextView() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Secc5") as? Secc5
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    @IBAction func continuar(_ sender: Any) {
        
        if tfExtra.text != "" {
            saveAnswers()
            print(CubetaDePreguntas.preguntasSecc4_7)
        }
        nextView()
    }
    
    func saveAnswers() {
        
        var juan = ""
        
        for palabra in tfExtra.text {
            
            if palabra != " " {
                juan += String(palabra)
            } else {
                CubetaDePreguntas.preguntasSecc4_7.append(juan)
                juan = ""
            }
            
        }
        
        CubetaDePreguntas.preguntasSecc4_7.append(juan)
        
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
