//
//  guidedPulseVC2.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit


class guidedPulseVC2: UIViewController {
    
    
    @IBOutlet var vsButton: UIButton!
    @IBOutlet var o2Button: UIButton!
    @IBOutlet var ecgButton: UIButton!
    @IBOutlet var teleButton: UIButton!
    
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vsButton.configureCheck()
        o2Button.configureCheck()
        ecgButton.configureCheck()
        teleButton.configureCheck()
        noButton.layer.cornerRadius = 8
        yesButton.layer.cornerRadius = 8
        self.navigationItem.title = "Tachycardia: Check List"
        
        
    }
    

    @IBAction func vsTapped(_ sender: Any) {
        
        if vsButton.isSelected == true{
            vsButton.configureCheck()}
        
        else{
            vsButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            vsButton.isSelected = true}
    }
    
    
    
    @IBAction func o2Pressed(_ sender: Any) {
        if o2Button.isSelected == true{
            o2Button.configureCheck()}
        
        else{
            o2Button.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            o2Button.isSelected = true}
    }
    
    
    
    @IBAction func ecgPressed(_ sender: Any) {
        
        if ecgButton.isSelected == true{
            ecgButton.configureCheck()}
        
        else{
            ecgButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            ecgButton.isSelected = true}}
    
    
    @IBAction func telePressed(_ sender: Any) {
        
        if teleButton.isSelected == true{
            teleButton.configureCheck()}
        
        else{
            teleButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            teleButton.isSelected = true}}
    
}
