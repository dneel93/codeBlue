//
//  guidedPulseVC5.swift
//  codeBlue
//
//  Created by Dylan Neel on 10/11/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class guidedPulseVC5: UIViewController {

    
    @IBOutlet var overdoseButton: UIButton!
    @IBOutlet var Pacing: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overdoseButton.configure(title: "Overdose DDx")
        Pacing.configure(title: "Pacing")


    }
    
    @IBAction func homeTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    

}
