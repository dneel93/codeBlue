//
//  guidedPulseVC3.swift
//  codeBlue
//
//  Created by Dylan Neel on 10/2/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class guidedPulseVC3: UIViewController {
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
        noButton.configureShadow()
        yesButton.configureShadow()
        self.navigationItem.title = "Bradycardia"
        
        
    }
    
    @IBAction func homeTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    

    @IBAction func vsTapped(_ sender: Any) {
        
        vsButton.checkOffOn()
    }
    
    
    
    @IBAction func o2Pressed(_ sender: Any) {
        o2Button.checkOffOn()
    }
    
    
    
    @IBAction func ecgPressed(_ sender: Any) {
        ecgButton.checkOffOn()
        }
    
    
    @IBAction func telePressed(_ sender: Any) {
        teleButton.checkOffOn()
        }
    
}
