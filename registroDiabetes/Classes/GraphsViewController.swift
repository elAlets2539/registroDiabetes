//
//  GraphsViewController.swift
//  registroDiabetes
//
//  Created by DevLabs on 2/28/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class GraphsViewController: UIViewController {

    @IBOutlet weak var elLabel: UILabel!
    
    var label = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elLabel.text = label
        
    }
    
    

}
