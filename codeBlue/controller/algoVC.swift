//
//  algoVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/16/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class algoVC: UIViewController {

    @IBOutlet var postArrest: UIButton!

    @IBOutlet var cardiacArrest: UIButton!
    
    @IBOutlet var tachy: UIButton!
    
    @IBOutlet var brady: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postArrest.configure(title: "Post-arrest Cardiac Care")
        tachy.configure(title: "Tachycardia")
        brady.configure(title: "Bradycardia")
        cardiacArrest.configure(title: "Cardiac Arrest")
        self.navigationItem.title = "ACLS Algorithms"
    }
    

}
