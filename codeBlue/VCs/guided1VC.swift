//
//  guided1VC.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class guided1VC: UIViewController {
    
    
    @IBOutlet var pulseButton: UIButton!
    
    @IBOutlet var noPulseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pulseButton.configure(title: "Pulse")
        noPulseButton.configure(title: "No Pulse")
        self.navigationItem.title = "Guided Code"
    
    }
    

}
