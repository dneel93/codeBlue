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
    @IBOutlet weak var assignButton: UIButton!
    
// MARK: label outlets
    @IBOutlet weak var o2Label: UILabel!
    @IBOutlet weak var cprListLabel: UILabel!
    @IBOutlet weak var assignLabel: UILabel!
    @IBOutlet weak var defibLabel: UILabel!
    
    
    
    private let cprTimer = timerClass(type: "CPR")
    private let cprVibration = cprVibrationTimer()
   
//  MARK: GLOBAL VARIABLE Labels/Button
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    
    @IBOutlet weak var resumeButton: UIButton!
    
//  MARK: YES NO BUTTON
    
    
//    MARK: TOP buttons
    @IBOutlet weak var roscButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var rolesButton: UIButton!
    @IBOutlet weak var causesButton: UIButton!
    
    
// MARK: Code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        roscButton.configure(title:"ROSC")
        algoButton.configure(title: "Algo")
        rolesButton.configure(title: "Roles")
        causesButton.configure(title: "H&T")
        cprButton.configureCheck()
        o2Button.configureCheck()
        defibButton.configureCheck()
        resetButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        
        assignButton.configureCheck()
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprTimer.setLabel(cprLabel, self, "noPulse1")
        resumeButton.isEnabled = false
        resumeButton.setBackgroundImage(UIImage(named:"white"), for: .disabled)
        resumeButton.setBackgroundImage(UIImage(named:"playButton"), for: .normal)
        
        


    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        cprTimer.invalidate()
        cprTimer.time = 120
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        resumeButton.isEnabled = false
        assignLabel.reset()
        cprListLabel.reset()
        o2Label.reset()
        defibLabel.reset()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        resetButton.setTitle("Stop", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
        
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprTimer.invalidate()
        cprLabel.text="2:00"
        cprButton.configureCheck()
        o2Button.configureCheck()
        defibButton.configureCheck()
        resumeButton.isEnabled = false
        
    }
    
    
    
    @IBAction func resetPressed(_ sender: Any) {
       
        
        if globalCounter.globalTimer?.isValid ?? false {
            globalCounter.globalTimer?.invalidate()
            resetButton.setTitle("Reset", for: .normal)
            resetButton.setTitleColor(.systemBlue, for: .normal)
            cprTimer.invalidate()
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
            resumeButton.isEnabled = true
        }
        
        
        
        else if globalCounter.globalTimer?.isValid == false && globalCounter.globalTimeCounter > 0 {
            
            resetButton.setTitle("Start", for: .normal)
            resetButton.setTitleColor(.systemGreen, for: .normal)
            globalCounter.globalReset()  
            cprTimer.invalidate()
            
            cprLabel.text = "2:00"
            cprVibration.timer?.invalidate()
          
            
            cprCountGlobal.text = "CPR: 0"
            epiCountGlobal.text="Epi: 0"
            shockCountGlobal.text = "Defib: 0"
            timeCountGlobal.text = "00:00"
            cprButton.configureCheck()
            o2Button.configureCheck()
            defibButton.configureCheck()
            assignButton.configureCheck()
            resumeButton.isEnabled = false
            assignLabel.reset()
            cprListLabel.reset()
            o2Label.reset()
            defibLabel.reset()
    
       }
        
        else {
            globalCounter.startGlobalTime()
            resetButton.setTitle("Stop", for: .normal)
            resetButton.setTitleColor(.systemRed, for: .normal)
            resumeButton.isEnabled = false
        }
        
    }
    
    
    
    @IBAction func resumePressed(_ sender: Any) {
        resumeButton.isEnabled = false
        
        if cprTimer.timer?.isValid == false && cprTimer.time < 120 {
            cprTimer.startTimer()
            
        }
        
        globalCounter.startGlobalTime()
        resetButton.setTitle("Stop", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
    }
    
    
    
//    UI Buttons
    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalTimer?.invalidate()
        cprTimer.timer?.invalidate()
        globalCounter.globalTimeCounter = 0
        timeCountGlobal.text = "00:00"
        globalCounter.globalReset()  
        cprVibration.time=0
        cprVibration.timer?.invalidate()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
// Top buttons
    
    @IBAction func rolesPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "codeStructure")
        self.present(vc, animated: true)
    }
    
    
    @IBAction func roscPress(_ sender: Any) {
        globalCounter.globalTimer?.invalidate()
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.systemBlue, for: .normal)
        cprTimer.invalidate()
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        resumeButton.isEnabled = true
        
        let storyboard = UIStoryboard(name: "Algos", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "rosc")
        self.present(vc, animated: true)
    }
    
    
    
    @IBAction func algoPress(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "cardiacAlgo1")
        self.present(vc, animated: true)
    
        }
    
    
    @IBAction func causesPressed(_ sender: Any) {
    
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "htCauses")
        self.present(vc, animated: true)
    
    }
    
    
    
    
    

    
//    MARK: CHECKLIST
    
    
    
    @IBAction func assignPress(_ sender: Any) {
        assignLabel.fadeLabel()
        
        if assignButton.isSelected == true{
            assignButton.configureCheck()
        }
        
        else{
            assignButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            assignButton.isSelected = true
            
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let vc = storyboard.instantiateViewController(withIdentifier: "codeStructure")
            self.present(vc, animated: true)}
        
    }
    
    @IBAction func cprPress(_ sender: Any) {
        cprButton.checkOffOn()
        cprListLabel.fadeLabel()
       


//       TIMER LOGIC for CPR (timer and vibration/alert)
        
        if cprTimer.timer?.isValid ?? false {
            cprTimer.invalidate()
            cprVibration.timer?.invalidate()
            cprVibration.time=120
            cprLabel.text = "2:00"
        }
        
        else if cprTimer.timer?.isValid == false && cprTimer.time == 0 {
            cprTimer.time = 120
            cprVibration.time=0
            cprVibration.timer?.invalidate()
            cprLabel.text = "2:00"
        }
        
        else{
            cprTimer.time = 120
            cprTimer.startTimer()
            globalCounter.cprCountGlobal+=1
            cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
            
            cprVibration.time = 0
            cprVibration.startVibration()
            cprAlert.sendAlert(VC: self)
        
        }
        
    }
    
    @IBAction func o2Press(_ sender: Any) {
    
        o2Button.checkOffOn()
        o2Label.fadeLabel()
        
    }
        
    @IBAction func defibPress(_ sender: Any) {
        defibButton.checkOffOn()
        defibLabel.fadeLabel()
    }
    
    
  
    
    
//    CPR correct alert
    
    
    
    

    
}
    
    
    
    

    
   
   

    
    

    

