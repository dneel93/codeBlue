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
    
    @IBOutlet weak var infoButton: UIButton!
    
    typealias arrowButtonTappedBlock = (_ button:UIButton) -> Void
    var arrowButtonTapped : arrowButtonTappedBlock!
    
    
    var name:String?
    var ddx:String?
    var expanded:Bool = false
    var rowHeightddx:Int?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
  @IBAction func infoPressed(_ sender: Any) {
        
    if arrowButtonTapped != nil {
        arrowButtonTapped(sender as! UIButton)
            }
    
    }
    
    
    func setColor(){
        
        let p = statusLabel.text
        
        switch p {
        
        case "?": statusLabel.backgroundColor = UIColor(red: CGFloat(111.0/255.0), green: CGFloat(128.0/255.0), blue: CGFloat(218.0/255.0), alpha: 1.0)
        
        case "Ruled in": statusLabel.backgroundColor = .systemGreen
            
        case "Ruled out":
            statusLabel.backgroundColor = .systemRed
        
            
        default:
            statusLabel.backgroundColor = UIColor(red: CGFloat(111.0/255.0), green: CGFloat(128.0/255.0), blue: CGFloat(218.0/255.0), alpha: 1.0)
            
        
    }
        
        
        

    }}
