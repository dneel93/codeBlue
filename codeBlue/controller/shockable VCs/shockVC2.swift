//
//  shockVC2.swift
//  codeBlue
//
//  Created by Dylan Neel on 4/23/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit
import AudioToolbox

class shockVC2: UIViewController {

    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var shockButton: UIButton!
    @IBOutlet weak var timeCountGlobal: UILabel!
    
    @IBOutlet weak var cprCountGlobal: UILabel!
    @IBOutlet weak var shockCountGlobal: UILabel!
    @IBOutlet weak var epiCountGlobal: UILabel!
    
    
    
    // MARK:- View did load methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shockButton.setImage(UIImage(named:"white"), for: .normal)
        shockButton.isEnabled = false
        yesButton.layer.cornerRadius = 8
        noButton.layer.cornerRadius = 8
        
        // MARK:- global
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        shockButton.imageView!.contentMode = UIView.ContentMode.scaleAspectFit
        
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        globalCprTimer.setLabelVC1(cprCountGlobal, self)
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        globalCprTimer.setLabelVC1(cprCountGlobal, self)
        globalCprTimer.continueCpr()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        shockButton.setImage(UIImage(named:"white"), for: .normal)
        shockButton.isEnabled = false
    }

    
    
// MARK:- Buttons
    
    
    @IBAction func noPressed(_ sender: Any) {
      //storyboard segue
    }
    
    @IBAction func yesPressed(_ sender: Any) {
        
        if shockButton.isEnabled == false{
            shockButton.setImage(UIImage(named:"Defib2"), for: .normal)
            shockButton.isEnabled = true
        }
        
        else{
            shockButton.setImage(UIImage(named:"white"), for: .normal)
            shockButton.isEnabled = false
            
        }}
    
    
    @IBAction func shockPressed(_ sender: Any) {
        globalCounter.defibCountGlobal+=1
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    

}
