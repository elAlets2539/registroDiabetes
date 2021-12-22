//
//  UserInfoViewController.swift
//  registroDiabetes
//
//  Created by DevLabs on 2/26/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit
import FirebaseDatabase
import MessageUI

class UserInfoViewController: UIViewController, MFMailComposeViewControllerDelegate {
    

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userAge: UILabel!
    @IBOutlet weak var userSex: UILabel!
    @IBOutlet weak var userTime: UILabel!
    
    @IBOutlet weak var elLabelOcultoEntreLasHojas: UILabel!
    
    var ref: DatabaseReference!
    var ref2: DatabaseReference!
    
    var image = UIImage()
    var name = ""
    var id = ""
    var age = ""
    var sex = ""
    var time = ""
    var firebaseId = ""
    var bool = ""
    var emoCtrlNum = ""
    
    var elChild = ""
    let elChildDelChild = ["secc1", "secc2", "secc3", "secc4", "secc5", "secc6", "secc7"]
    let lasSecciones = ["Seccion 1", "Seccion 2", "Seccion 3", "Seccion 4", "Seccion 5", "Seccion 6", "Seccion 7"]
    
    var contentsOfFile: String = "Nombre,ID,Edad,Sexo,Tiempo de diagnostico\n"
    var contentsOfFile2: String = "Nombre,ID,Edad,Sexo,Tiempo de diagnostico\n"
    var contentsOfFileSecc4: String = "Seccion 4"
    var contentsOfFileSecc42: String = "Seccion 4"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImage.image = image
        userName.text = name
        userId.text = id
        userAge.text = age
        userSex.text = sex
        userTime.text = time
        
        //CubetaDePreguntas.eraseAllPreguntasArrays()
        
        CubetaDePreguntas.setFirebaseId(laKey: firebaseId)
        CubetaDePreguntas.setBool(elBool: bool)
        
        generateContentsOfFile()
        retrieveQuestions()
        retrieveLasOtrasQuestions()
        
    }
    
    @IBAction func graphsPressed(_ sender: Any) {
        
        let graphsView = self.storyboard?.instantiateViewController(withIdentifier: "GraphsViewController") as? GraphsViewController
        
        graphsView?.label = "Aquí van las gráficas de \(name)"
        
        self.navigationController?.pushViewController(graphsView!, animated: true)
        
    }
    
    @IBAction func uploadPressed(_ sender: Any) {
        
        prepareContentsOfFile()
        
        let emailViewController = configuredMailComposeViewController()
        
        if MFMailComposeViewController.canSendMail() {
            
            self.present(emailViewController, animated: true, completion: nil)
            
        }
        
        //CubetaDePreguntas.eraseAllPreguntasArrays()
        //Temp.eraseAllPreguntasArrays()
        
    }
    
    @IBAction func emotionsPressed(_ sender: Any) {
        
        let emotionsView = self.storyboard?.instantiateViewController(withIdentifier: "ControlEmocionesViewController") as? ControlEmocionesViewController
        
        emotionsView?.firebaseId = firebaseId
        emotionsView?.emoCtrlNum = emoCtrlNum
        
        self.navigationController?.present(emotionsView!, animated: true, completion: nil)
        
    }
    
    @IBAction func preguntasPressed(_ sender: Any) {
        
        if CubetaDePreguntas.bool == "supertrue" {
            showAlert()
        } else {
        
            let preguntasView = self.storyboard?.instantiateViewController(withIdentifier: "Preguntas") as? Preguntas
            
            self.navigationController?.pushViewController(preguntasView!, animated: true)
        
        }
    }
    
    func generateContentsOfFile() {
        contentsOfFile.append(contentsOf: "\(name),\(id),\(age),\(sex),\(time)\n\nPreguntas previas\n")
        contentsOfFile2.append(contentsOf: "\(name),\(id),\(age),\(sex),\(time)\n\nPreguntas posteriores\n")
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "No se puede agregar otra sesión", message: "Las dos sesiones de la intervención ya han sido agregadas.", preferredStyle: .alert)
        let aceptarButton = UIAlertAction(title: "Ok", style: .default, handler: self.ok)
        alert.addAction(aceptarButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func ok(alert: UIAlertAction!) {}
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        
        let data = contentsOfFile.data(using: String.Encoding.utf8, allowLossyConversion: false)
        let data1_2 = contentsOfFileSecc4.data(using: String.Encoding.utf8, allowLossyConversion: false)
        let data2 = contentsOfFile2.data(using: String.Encoding.utf8, allowLossyConversion: false)
        let data2_2 = contentsOfFileSecc42.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        if let content = data {
            print("NSData: \(content)")
        }
        if let content1_2 = data1_2 {
            print("NSData: \(content1_2)")
        }
        if let content2 = data2 {
            print("NSData: \(content2)")
        }
        if let content2_2 = data2_2 {
            print("NSData: \(content2_2)")
        }
        
        let emailController = MFMailComposeViewController()
        
        emailController.mailComposeDelegate = self
        //emailController.setToRecipients([""])
        emailController.setSubject("Registro Diabetes")
        emailController.setMessageBody("", isHTML: false)
        
        emailController.addAttachmentData(data!, mimeType: "text/csv", fileName: "registroPrevio\(name).csv")
        emailController.addAttachmentData(data1_2!, mimeType: "text/csv", fileName: "registroPrevioSecc4\(name)")
        emailController.addAttachmentData(data2!, mimeType: "text/csv", fileName: "registroPosterior\(name).csv")
        emailController.addAttachmentData(data2_2!, mimeType: "text/csv", fileName: "registroPosteriorSecc4\(name)")
        return emailController
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    func retrieveQuestions() {
        
        if bool == "true" {
            elChild = "questionsBefore"
        } else if bool == "supertrue" {
            elChild = "questionsAfter"
        } else {
            elChild = ""
        }
        
        if elChild != "" {
            
            for i in 0...6 {
                
                ref = Database.database().reference().child(firebaseId).child("questionsBefore").child(elChildDelChild[i])
                ref.observe(DataEventType.value, with: {(snapshot) in
                    
                    if snapshot.childrenCount > 0 {
                        
                        switch i {
                            
                        case 0:
                            self.contentsOfFile.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...56 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp.preguntasSecc1.append(patientAnswer as! String)
                                self.contentsOfFile.append(contentsOf: "," + Temp.preguntasSecc1[j])
                            }
                            break;
                        case 1:
                            self.contentsOfFile.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...37 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp.preguntasSecc2.append(patientAnswer as! String)
                                self.contentsOfFile.append(contentsOf: "," + Temp.preguntasSecc2[j])
                            }
                            break;
                        case 2:
                            self.contentsOfFile.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...7 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp.preguntasSecc3.append(patientAnswer as! String)
                                self.contentsOfFile.append(contentsOf: "," + Temp.preguntasSecc3[j])
                            }
                            break;
                        case 3:
                            var cont = 1
                            self.contentsOfFileSecc4.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsBefore").child(self.elChildDelChild[i]).child("pregunta1")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp.preguntasSecc4_1.append(patientAnswer as! String)
                                        self.contentsOfFileSecc4.append(contentsOf: Temp.preguntasSecc4_1[k] + ",")
                                        print("----\(Temp.preguntasSecc4_1[k])----")
                                    }
                                    self.contentsOfFileSecc4.append("\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc4.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsBefore").child(self.elChildDelChild[i]).child("pregunta2")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp.preguntasSecc4_2.append(patientAnswer as! String)
                                        self.contentsOfFileSecc4.append(contentsOf: Temp.preguntasSecc4_2[k] + ",")
                                        print("----\(Temp.preguntasSecc4_2[k])----")
                                    }
                                    self.contentsOfFileSecc4.append("\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc4.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsBefore").child(self.elChildDelChild[i]).child("pregunta3")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp.preguntasSecc4_3.append(patientAnswer as! String)
                                        self.contentsOfFileSecc4.append(contentsOf: Temp.preguntasSecc4_3[k] + ",")
                                        print("----\(Temp.preguntasSecc4_3[k])----")
                                    }
                                    self.contentsOfFileSecc4.append("\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc4.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsBefore").child(self.elChildDelChild[i]).child("pregunta4")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp.preguntasSecc4_4.append(patientAnswer as! String)
                                        self.contentsOfFileSecc4.append(contentsOf: Temp.preguntasSecc4_4[k] + ",")
                                        print("----\(Temp.preguntasSecc4_4[k])----")
                                    }
                                    self.contentsOfFileSecc4.append("\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc4.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsBefore").child(self.elChildDelChild[i]).child("pregunta5")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp.preguntasSecc4_5.append(patientAnswer as! String)
                                        self.contentsOfFileSecc4.append(contentsOf: Temp.preguntasSecc4_5[k] + ",")
                                        print("----\(Temp.preguntasSecc4_5[k])----")
                                    }
                                    self.contentsOfFileSecc4.append("\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc4.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsBefore").child(self.elChildDelChild[i]).child("pregunta6")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp.preguntasSecc4_6.append(patientAnswer as! String)
                                        self.contentsOfFileSecc4.append(contentsOf: Temp.preguntasSecc4_6[k] + ",")
                                        print("----\(Temp.preguntasSecc4_6[k])----")
                                    }
                                    self.contentsOfFileSecc4.append("\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc4.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsBefore").child(self.elChildDelChild[i]).child("preguntaExtra")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp.preguntasSecc4_7.append(patientAnswer as! String)
                                        self.contentsOfFileSecc4.append(contentsOf: Temp.preguntasSecc4_7[k] + ",")
                                        print("----\(Temp.preguntasSecc4_7[k])----")
                                    }
                                    self.contentsOfFileSecc4.append("\n")
                                }
                            })
                            break;
                        case 4:
                            self.contentsOfFile.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...7 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp.preguntasSecc5.append(patientAnswer as! String)
                                self.contentsOfFile.append(contentsOf: "," + Temp.preguntasSecc5[j])
                            }
                            break;
                        case 5:
                            self.contentsOfFile.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...19 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp.preguntasSecc6.append(patientAnswer as! String)
                                self.contentsOfFile.append(contentsOf: "," + Temp.preguntasSecc6[j])
                            }
                            break;
                        case 6:
                            self.contentsOfFile.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...20 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp.preguntasSecc7.append(patientAnswer as! String)
                                self.contentsOfFile.append(contentsOf: "," + Temp.preguntasSecc7[j])
                            }
                            break;
                        default:
                            print("Default")
                        }
                        
                    }
                    
                })
                
            }
            
        }
        
        Temp.eraseAllPreguntasArrays()
        
    }
    
    func retrieveLasOtrasQuestions() {
        
        if elChild == "questionsAfter" {
            
            for i in 0...6 {
                
                ref = Database.database().reference().child(firebaseId).child("questionsAfter").child(elChildDelChild[i])
                ref.observe(DataEventType.value, with: {(snapshot) in
                    
                    if snapshot.childrenCount > 0 {
                        
                        switch i {
                            
                        case 0:
                            self.contentsOfFile2.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...56 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp2.preguntasSecc1.append(patientAnswer as! String)
                                self.contentsOfFile2.append(contentsOf: "," + Temp2.preguntasSecc1[j])
                            }
                            break;
                        case 1:
                            self.contentsOfFile2.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...37 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp2.preguntasSecc2.append(patientAnswer as! String)
                                self.contentsOfFile2.append(contentsOf: "," + Temp2.preguntasSecc2[j])
                            }
                            break;
                        case 2:
                            self.contentsOfFile2.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...7 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp2.preguntasSecc3.append(patientAnswer as! String)
                                self.contentsOfFile2.append(contentsOf: "," + Temp2.preguntasSecc3[j])
                            }
                            break;
                        case 3:
                            var cont = 1
                            self.contentsOfFileSecc42.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsAfter").child(self.elChildDelChild[i]).child("pregunta1")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp2.preguntasSecc4_1.append(patientAnswer as! String)
                                        self.contentsOfFileSecc42.append(contentsOf: Temp2.preguntasSecc4_1[k] + ",")
                                        print("----\(Temp2.preguntasSecc4_1[k])----")
                                    }
                                    self.contentsOfFileSecc42.append(contentsOf: "\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc42.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsAfter").child(self.elChildDelChild[i]).child("pregunta2")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp2.preguntasSecc4_2.append(patientAnswer as! String)
                                        self.contentsOfFileSecc42.append(contentsOf: Temp2.preguntasSecc4_2[k] + ",")
                                        print("----\(Temp2.preguntasSecc4_2[k])----")
                                    }
                                    self.contentsOfFileSecc42.append(contentsOf: "\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc42.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsAfter").child(self.elChildDelChild[i]).child("pregunta3")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp2.preguntasSecc4_3.append(patientAnswer as! String)
                                        self.contentsOfFileSecc42.append(contentsOf: Temp2.preguntasSecc4_3[k] + ",")
                                        print("----\(Temp2.preguntasSecc4_3[k])----")
                                    }
                                    self.contentsOfFileSecc42.append(contentsOf: "\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc42.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsAfter").child(self.elChildDelChild[i]).child("pregunta4")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp2.preguntasSecc4_4.append(patientAnswer as! String)
                                        self.contentsOfFileSecc42.append(contentsOf: Temp2.preguntasSecc4_4[k] + ",")
                                        print("----\(Temp2.preguntasSecc4_4[k])----")
                                    }
                                    self.contentsOfFileSecc42.append(contentsOf: "\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc42.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsAfter").child(self.elChildDelChild[i]).child("pregunta5")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp2.preguntasSecc4_5.append(patientAnswer as! String)
                                        self.contentsOfFileSecc42.append(contentsOf: Temp2.preguntasSecc4_5[k] + ",")
                                        print("----\(Temp2.preguntasSecc4_5[k])----")
                                    }
                                    self.contentsOfFileSecc42.append(contentsOf: "\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc42.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsAfter").child(self.elChildDelChild[i]).child("pregunta6")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp2.preguntasSecc4_6.append(patientAnswer as! String)
                                        self.contentsOfFileSecc42.append(contentsOf: Temp2.preguntasSecc4_6[k] + ",")
                                        print("----\(Temp2.preguntasSecc4_6[k])----")
                                    }
                                    self.contentsOfFileSecc42.append(contentsOf: "\n")
                                }
                            })
                            cont += 1
                            self.contentsOfFileSecc42.append("\n\(self.lasSecciones[i])_\(cont)\n")
                            self.ref2 = Database.database().reference().child(self.firebaseId).child("questionsAfter").child(self.elChildDelChild[i]).child("preguntaExtra")
                            self.ref2.observe(DataEventType.value, with: {(snapshot2) in
                                
                                if snapshot2.childrenCount > 0 {
                                    let numDeHijos = Int(snapshot2.childrenCount)
                                    for k in 0..<numDeHijos {
                                        let patientAnswer = (snapshot2.children.allObjects as! [DataSnapshot])[k].value!
                                        Temp2.preguntasSecc4_7.append(patientAnswer as! String)
                                        self.contentsOfFileSecc42.append(contentsOf: Temp2.preguntasSecc4_7[k] + ",")
                                        print("----\(Temp2.preguntasSecc4_7[k])----")
                                    }
                                    self.contentsOfFileSecc42.append(contentsOf: "\n")
                                }
                            })
                            break;
                        case 4:
                            self.contentsOfFile2.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...7 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp2.preguntasSecc5.append(patientAnswer as! String)
                                self.contentsOfFile2.append(contentsOf: "," + Temp2.preguntasSecc5[j])
                            }
                            break;
                        case 5:
                            self.contentsOfFile2.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...19 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp2.preguntasSecc6.append(patientAnswer as! String)
                                self.contentsOfFile2.append(contentsOf: "," + Temp2.preguntasSecc6[j])
                            }
                            break;
                        case 6:
                            self.contentsOfFile2.append("\n\(self.lasSecciones[i])\n")
                            for j in 0...20 {
                                let patientAnswer = (snapshot.children.allObjects as! [DataSnapshot])[j].value!
                                Temp2.preguntasSecc7.append(patientAnswer as! String)
                                self.contentsOfFile2.append(contentsOf: "," + Temp2.preguntasSecc7[j])
                            }
                            break;
                        default:
                            print("Default")
                        }
                        
                    }
                    
                })
                
            }
            
        }
        
        Temp2.eraseAllPreguntasArrays()
        
    }
    
    func prepareContentsOfFile() {
        
        print(contentsOfFile)
        print(contentsOfFile2)
        
    }
    
}
