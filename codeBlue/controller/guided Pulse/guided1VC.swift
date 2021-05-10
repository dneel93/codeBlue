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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.globalTimer?.invalidate()
        globalCounter.globalTimeCounter = 0
        globalCounter.cprCountGlobal = 0
        globalCounter.epiCountGlobal = 0
        globalCounter.defibCountGlobal = 0
    }
    
    
 
    @IBAction func pulsePressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "guidedPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "guidedPulse") as! guidedPulseVC1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func noPulsePressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "guidedNoPulse") as! guidedNoPulseVC1
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
