//
//  UserDataViewController.swift
//  registroDiabetes
//
//  Created by DevLabs on 2/25/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UserDataViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var fotoLabel: UIImageView!
    
    var ref: DatabaseReference!
    
    var sex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        idTextField.delegate = self
        ageTextField.delegate = self
        sex = 0
        timeTextField.delegate = self

    }
    
    @IBAction func salvaguardar(_ sender: Any) {
        
        if allDataIsProvided() {
        
            var setso = ""
            
            if sexSegmentedControl.selectedSegmentIndex == 0 {
                setso = "Mujer"
            } else {
                setso = "Hombre"
            }
            
            ////////////////////////
            
            ref = Database.database().reference()
            let key = ref.childByAutoId().key
            ref.child(key!).setValue(["name":nameTextField.text!, "id":idTextField.text!, "age":ageTextField.text!, "sex":setso, "time":timeTextField.text!, "firebaseId":key, "bool":"false", "questionsBefore":nil, "questionsAfter":nil, "emotionsControl":nil, "numberOfEmotionsControlled":"0"])
            
            ////////////////////////
            
            //Cubeta.addUser(elName: nameTextField.text!, elId: idTextField.text!, laFoto: fotoLabel.image!, laAge: ageTextField.text!, elSex: setso, elTime: timeTextField.text!)
            
            //dismiss(animated: true, completion: nil)
            _ = navigationController?.popToRootViewController(animated: true)
            
        } else {
            showAlert()
        }
        
    }
    
    @IBAction func yaAlv(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addPicture(_ sender: Any) {
        
        let imageController = UIImagePickerController()
        
        imageController.delegate = self
        imageController.sourceType = .photoLibrary
        
        self.present(imageController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        fotoLabel.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    @IBAction func sexSelected(_ sender: Any) {
        sex = 1
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Formulario incompleto", message: "Proporcione todos los datos para poder continuar", preferredStyle: .alert)
        let aceptarButton = UIAlertAction(title: "Ok", style: .default, handler: self.ok)
        alert.addAction(aceptarButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func ok(alert: UIAlertAction!) {}
    
    func allDataIsProvided() -> Bool {
        
        if (nameTextField.text != "") && (idTextField.text != "") && (ageTextField.text != "") && (sex != 0) && (timeTextField.text != "") {
            return true
        } else {
            return false
        }
        
    }
    
}
