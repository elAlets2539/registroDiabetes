//
//  TableViewCell.swift
//  registroDiabetes
//
//  Created by DevLabs on 2/26/19.
//  Copyright © 2019 DevLabs. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellName: UILabel!
    
    @IBOutlet weak var cellId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUser(user: User) {
        
        cellImageView.image = user.photo
        cellName.text = user.name
        cellId.text = user.id
        
    }
    
}
