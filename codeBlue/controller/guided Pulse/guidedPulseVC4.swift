//
//  guidedPulseVC4.swift
//  codeBlue
//
//  Created by Dylan Neel on 10/2/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class guidedPulseVC4: UIViewController {

 
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noButton.configure(title: "No")
        yesButton.configure(title: "Yes")

    }
    
    @IBAction func homeTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    



}
