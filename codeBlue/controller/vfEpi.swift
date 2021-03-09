//
//  vfEpi.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/3/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class vfEpi: UIViewController {
    
//    MARK: Variables
    
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var epiButton: UIButton!
    @IBOutlet var intButton: UIButton!
    @IBOutlet var shockButton: UIButton!
    @IBOutlet var epiLabel: UILabel!
    
    @IBOutlet weak var roscButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var rolesButton: UIButton!
    
    private let cprTimer = timerClass(type: "CPR")
    private let epiTimer = timerClass(type: "Epi")
    private let cprVibration = cprVibrationTimer()
    
//    MARK: GLOBAL VARIABLES
    
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    
    
    @IBOutlet weak var resumeButton: UIButton!
    

//    MARK:  Code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        noButton.layer.cornerRadius = 8
        yesButton.layer.cornerRadius = 8
        algoButton.layer.cornerRadius = 8
        roscButton.layer.cornerRadius = 8
        rolesButton.layer.cornerRadius = 8
        cprButton.configureCheck()
        epiButton.configureCheck()
        intButton.configureCheck()
        shockButton.configureCheck()
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprTimer.setLabel(cprLabel, self)
        epiTimer.setLabel(epiLabel, self)
        resumeButton.isEnabled = false
        resumeButton.setBackgroundImage(UIImage(named:"white"), for: .disabled)
        resumeButton.setBackgroundImage(UIImage(named:"playButton"), for: .normal)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        var minutes: Int
        var seconds: Int
        minutes = (globalCounter.globalTimeCounter % 3600) / 60
        seconds = (globalCounter.globalTimeCounter % 3600) % 60
        timeCountGlobal.text = String(format: "Total Time: %02d:%02d", minutes, seconds)
       
        cprTimer.timer?.invalidate()
        epiTimer.timer?.invalidate()
        cprLabel.text="Start CPR"
        epiLabel.text = "Epinephrine 1mg"
       
        cprButton.configureCheck()
        epiButton.configureCheck()
        intButton.configureCheck()
        shockButton.configureCheck()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        cprTimer.invalidate()
        cprTimer.time = 0
        epiTimer.invalidate()
        epiTimer.time = 0
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        resumeButton.isEnabled = false
    }
    
    
    
    @IBAction func resetTapped(_ sender: Any) {
        
        if globalCounter.globalTimer?.isValid ?? false {
            globalCounter.globalTimer?.invalidate()
            resetButton.setTitle("Reset", for: .normal)
            resetButton.setTitleColor(.systemBlue, for: .normal)
            cprTimer.timer?.invalidate()
            epiTimer.timer?.invalidate()
            cprVibration.timer?.invalidate()
            resumeButton.isEnabled = true
        }
        
        else if globalCounter.globalTimer?.isValid == false && globalCounter.globalTimeCounter > 0 {
            
            resetButton.setTitle("Start", for: .normal)
            resetButton.setTitleColor(.systemGreen, for: .normal)
            globalCounter.cprCountGlobal = 0
            globalCounter.epiCountGlobal = 0
            globalCounter.defibCountGlobal = 0
            globalCounter.globalTimeCounter = 0
            cprCountGlobal.text = "CPR: 0"
            epiCountGlobal.text = "Epi: 0"
            shockCountGlobal.text = "Defib: 0"
            timeCountGlobal.text = "Total Time: 00:00"
            cprButton.configureCheck()
            epiButton.configureCheck()
            intButton.configureCheck()
            shockButton.configureCheck()
            cprTimer.timer?.invalidate()
            epiTimer.timer?.invalidate()
            epiLabel.text = "Epinephrine 1mg"
            cprLabel.text = "Start CPR"
            resumeButton.isEnabled = false
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
        
        if cprTimer.timer?.isValid == false && cprTimer.time > 0 {
            cprTimer.startTimer()
            
        }
        
        if epiTimer.timer?.isValid == false && epiTimer.time > 0 {
            epiTimer.startTimer()
            
        }
        
        globalCounter.startGlobalTime()
        resetButton.setTitle("Stop", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
    }

    
//    UI Buttons
        
        
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.cprCountGlobal = 0
        globalCounter.epiCountGlobal = 0
        globalCounter.defibCountGlobal = 0
        globalCounter.globalTimeCounter=0
        globalCounter.globalTimer.invalidate()
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        
        cprCountGlobal.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockCountGlobal.text = "Defib: 0"
        timeCountGlobal.text = "Total Time: 00:00"
        
        self.navigationController?.popToRootViewController(animated: true)
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
        let vc = storyboard.instantiateViewController(withIdentifier: "cardiacAlgo")
        self.present(vc, animated: true)
    }
    
    
    
    
    
    @IBAction func structurePressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "codeStructure")
        self.present(vc, animated: true)
    }
    

    @IBAction func noPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "asystolePEA") as! asystolePEA
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
//    MARK: Checklist
    
    @IBAction func cprPressed(_ sender: Any) {
        
        cprButton.checkOffOn()
        
        if cprTimer.timer?.isValid ?? false {
            cprTimer.invalidate()
            cprLabel.text = "Start CPR"
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
        }
        
        else if cprTimer.timer?.isValid == false && cprTimer.time == 120 {
            cprTimer.time = 0
            cprLabel.text = "Start CPR"
        }
        
        else{
            cprTimer.time = 0
            cprTimer.startTimer()
            globalCounter.cprCountGlobal+=1
            cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
            cprVibration.time = 0
            cprVibration.startVibration()
            cprAlert.sendAlert(VC: self)
        }
    
        
    }
    
    
    @IBAction func shockPressed(_ sender: Any) {
        
        if shockButton.isSelected == true{
            shockButton.configureCheck()}
        
        else{
            shockButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            shockButton.isSelected = true
            globalCounter.defibCountGlobal+=1
            shockCountGlobal.text = "Defib:\(globalCounter.defibCountGlobal)"
        }
        
    }
    
    
    @IBAction func epiPressed(_ sender: Any) {
        epiButton.checkOffOn()
        
        if epiTimer.timer?.isValid ?? false {
            epiTimer.invalidate()
            epiLabel.text = "Epinephrine 1mg"
        }
        
        else if epiTimer.timer?.isValid == false && epiTimer.time == 120 {
            epiTimer.time = 0
            epiLabel.text = "Epinephrine 1mg"
        }
        
        else{
            epiTimer.time = 0
            epiTimer.startTimer()
            globalCounter.epiCountGlobal+=1
            epiCountGlobal.text = "Epi: \(globalCounter.epiCountGlobal)"}
        
    }
    
    
    @IBAction func intPressed(_ sender: Any) {
        intButton.checkOffOn()
    }
    
    
    
    

}
