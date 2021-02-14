//
//  guidedNoPulseVC1.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit
import AudioToolbox


class guidedNoPulseVC1: UIViewController {

//  MARK: CHECKLIST variables
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var o2Button: UIButton!
    @IBOutlet var defibButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    
    private let cprTimer = timerClass(type: "CPR")
    private let cprVibration = cprVibrationTimer()
   
//  MARK: GLOBAL VARIABLE Labels/Button
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var resetGlobalButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    
//  MARK: YES NO BUTTON
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    
    
// MARK: Code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        noButton.configure(title: "No")
        yesButton.configure(title: "Yes")
        cprButton.configureCheck()
        o2Button.configureCheck()
        defibButton.configureCheck()
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        
        cprTimer.setLabel(cprLabel, self)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        cprTimer.invalidate()
        cprTimer.time = 0
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
    }
    


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprTimer.timer?.invalidate()
        cprLabel.text="Start CPR"
        cprButton.configureCheck()
        o2Button.configureCheck()
        defibButton.configureCheck()
    }
    
    
    
    @IBAction func resetPressed(_ sender: Any) {
       
        
        if globalCounter.globalTimer?.isValid ?? false {
            globalCounter.globalTimer?.invalidate()
            resetGlobalButton.setTitle("Reset", for: .normal)
            resetGlobalButton.setTitleColor(.systemBlue, for: .normal)
            cprTimer.invalidate()
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
        }
        
        else if globalCounter.globalTimer?.isValid == false && globalCounter.globalTimeCounter > 0 {
            
            resetGlobalButton.setTitle("Start", for: .normal)
            resetGlobalButton.setTitleColor(.systemGreen, for: .normal)
            globalCounter.cprCountGlobal = 0
            globalCounter.epiCountGlobal = 0
            globalCounter.defibCountGlobal = 0
            globalCounter.globalTimeCounter = 0
            cprTimer.timer?.invalidate()
            cprLabel.text = "Start CPR"
            
            cprCountGlobal.text = "CPR: 0"
            epiCountGlobal.text="Epi: 0"
            shockCountGlobal.text = "Defib: 0"
            timeCountGlobal.text = "Total Time: 00:00"
            cprButton.configureCheck()
            o2Button.configureCheck()
            defibButton.configureCheck()
       }
        
        else {
            globalCounter.startGlobalTime()
            resetGlobalButton.setTitle("Stop", for: .normal)
            resetGlobalButton.setTitleColor(.systemRed, for: .normal)}
        
    }
    
    
    
//    UI Buttons
    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalTimer?.invalidate()
        cprTimer.timer?.invalidate()
        globalCounter.globalTimeCounter = 0
        timeCountGlobal.text = "Total Time: 00:00"
        globalCounter.cprCountGlobal = 0
        globalCounter.epiCountGlobal = 0
        globalCounter.defibCountGlobal = 0
        cprVibration.time=0
        cprVibration.timer?.invalidate()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
//    MARK: CHECKLIST

    @IBAction func cprPress(_ sender: Any) {
        cprButton.checkOffOn()
        
       


//       TIMER LOGIC
        
        if cprTimer.timer?.isValid ?? false {
            cprTimer.invalidate()
            cprVibration.timer?.invalidate()
            cprVibration.time=0
            cprLabel.text = "Start CPR"
        }
        
        else if cprTimer.timer?.isValid == false && cprTimer.time == 120 {
            cprTimer.time = 0
            cprVibration.time=0
            cprVibration.timer?.invalidate()
            cprLabel.text = "Start CPR"
        }
        
        else{
            cprTimer.time = 0
            cprTimer.startTimer()
            globalCounter.cprCountGlobal+=1
            cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
            
            cprAlert.sendAlert(VC: self)
            cprVibration.startVibration()
        
        }
        
    }
    
    @IBAction func o2Press(_ sender: Any) {
    
        o2Button.checkOffOn()
    }
        
    @IBAction func defibPress(_ sender: Any) {
        defibButton.checkOffOn()
    }
    
    
    
//    CPR correct alert
    
    
    
    

    
}
    
    
    
    

    
   
   

    
    

    

