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
        tachyButton.configure(title: "Tachycardia")
        bradyButton.configure(title:"Bradycardia")
        self.navigationItem.title = "Pulse"
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
