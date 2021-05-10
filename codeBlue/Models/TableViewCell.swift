//
//  TableViewCell.swift
//  codeBlue
//
//  Created by Dylan Neel on 4/17/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setColor(){
        
        let p = statusLabel.text
        
        switch p {
        
        case "?": statusLabel.backgroundColor = .systemIndigo
        
        case "Ruled in": statusLabel.backgroundColor = .systemGreen
            
        case "Ruled out":
            statusLabel.backgroundColor = .systemRed
        
            
        default:
            statusLabel.backgroundColor = .systemIndigo
            
        
        
    }

    }}
