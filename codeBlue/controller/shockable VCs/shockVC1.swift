//
//  shockVC1.swift
//  codeBlue
//
//  Created by Dylan Neel on 4/21/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit
import AudioToolbox

class shockVC1: UIViewController {

    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var shockButton: UIButton!
    
    @IBOutlet weak var timeCountGlobal: UILabel!
    
    
    
//    Global variable labels
    @IBOutlet weak var cprCountGlobal: UILabel!
    @IBOutlet weak var shockCountGlobal: UILabel!
    @IBOutlet weak var epiCountGlobal: UILabel!
    
    // MARK:- View did load methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shockButton.setImage(UIImage(named:"white_2"), for: .normal)
        shockButton.isEnabled = false
        yesButton.configureShadow()
        noButton.configureShadow()
       
        

        
        // MARK:- global
        globalEpiTimer.setLabelVC1(epiCountGlobal, self)
        globalEpiTimer.continueEpiTimer()
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.continueGlobalTime()
        globalCprTimer.setLabelVC1(cprCountGlobal, self)
        globalCprTimer.continueCpr()
        
        shockButton.imageView!.contentMode = UIView.ContentMode.scaleAspectFit
        
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.continueGlobalTime()
        globalCprTimer.setLabelVC1(cprCountGlobal, self)
        globalCprTimer.continueCpr()
        globalEpiTimer.setLabelVC1(epiCountGlobal, self)
        globalEpiTimer.continueEpiTimer()
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        shockButton.setImage(UIImage(named:"white_2"), for: .normal)
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
            shockButton.setImage(UIImage(named:"white_2"), for: .normal)
            shockButton.isEnabled = false
            
        }}
    
    
    @IBAction func shockPressed(_ sender: Any) {
        globalCounter.defibCountGlobal+=1
        let time = eventLog.getDate()
        eventLog.eventTime.append("Defibrillation: \(time)")
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    

    
    

    

}
