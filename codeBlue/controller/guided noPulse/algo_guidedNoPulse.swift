//
//  algo_guidedNoPulse.swift
//  codeBlue
//
//  Created by Dylan Neel on 2/21/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

class algo_guidedNoPulse: UIViewController {
    
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func backPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    



}
