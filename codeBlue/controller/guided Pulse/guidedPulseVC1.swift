//
//  guidedPulseVC1.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class guidedPulseVC1: UIViewController {

    
    @IBOutlet var tachyButton: UIButton!
    @IBOutlet var bradyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tachyButton.configureShadow()
        bradyButton.configureShadow()
        self.navigationItem.title = "Pulse"
    
    }
    

    @IBAction func homeTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    

}
