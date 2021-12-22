//
//  ViewController.swift
//  registroDiabetes
//
//  Created by DevLabs on 2/25/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTableView()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        tableView.reloadData()
        
        updateTableView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cubeta.usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let elUser = Cubeta.usersArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.setUser(user: elUser)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            ref = Database.database().reference()
            
            let elId: String = Cubeta.usersArray[indexPath.row].firebaseId
            ref.child(elId).setValue(nil)
            Cubeta.removeUser(elIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController") as? UserInfoViewController
        
        vc?.image = Cubeta.usersArray[indexPath.row].photo
        vc?.name = Cubeta.usersArray[indexPath.row].name
        vc?.id = Cubeta.usersArray[indexPath.row].id
        vc?.age = Cubeta.usersArray[indexPath.row].age
        vc?.sex = Cubeta.usersArray[indexPath.row].sex
        vc?.time = Cubeta.usersArray[indexPath.row].time
        vc?.firebaseId = Cubeta.usersArray[indexPath.row].firebaseId
        vc?.bool = Cubeta.usersArray[indexPath.row].bool
        vc?.emoCtrlNum = Cubeta.usersArray[indexPath.row].emoCtrlNum
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func updateTableView() {
        
        ref = Database.database().reference()
        
        ref.observe(DataEventType.value, with: {(snapshot) in
            
            if snapshot.childrenCount > 0 {
                
                Cubeta.usersArray.removeAll()
                
                for patient in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let patientObject = patient.value as? [String: AnyObject]
                    let patientName = patientObject?["name"]
                    let patientId = patientObject?["id"]
                    let patientAge = patientObject?["age"]
                    let patientSex = patientObject?["sex"]
                    let patientTime = patientObject?["time"]
                    let patientFirebaseId = patientObject?["firebaseId"]
                    let patientBool = patientObject?["bool"]
                    let patientEmoCtrlNum = patientObject?["numberOfEmotionsControlled"]
                    
                    Cubeta.usersArray.append(User.init(nombre: patientName as! String, aidi: patientId as! String, foto: UIImage.init(imageLiteralResourceName: "add"), edad: patientAge as! String, sexo: patientSex as! String, tiempo: patientTime as! String, elFirebaseId: patientFirebaseId as! String, elBool: patientBool as! String, elEmoCtrlNum: patientEmoCtrlNum as! String))
                    
                }
                
                self.tableView.reloadData()
                
            }
            
        })
        
    }
    
}

