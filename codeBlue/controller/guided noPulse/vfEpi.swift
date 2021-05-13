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
    
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var epiButton: UIButton!
    @IBOutlet var intButton: UIButton!
    @IBOutlet var epiLabel: UILabel!
    
    @IBOutlet weak var roscButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var rolesButton: UIButton!
    
    @IBOutlet weak var htButton: UIButton!
    
    
// MARK: Labels
    
    @IBOutlet weak var cprListLabel: UILabel!
    @IBOutlet weak var intLabel: UILabel!
    
    
    
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
        resetButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        
        
        algoButton.layer.cornerRadius = 8
        roscButton.layer.cornerRadius = 8
        rolesButton.layer.cornerRadius = 8
        htButton.layer.cornerRadius = 8
        cprButton.configureCheck()
        epiButton.configureCheck()
        intButton.configureCheck()

        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprTimer.setLabel(cprLabel, self,"noPulse5")
        epiTimer.setLabel(epiLabel, self,"noPulse5")
        resumeButton.isEnabled = false
        resumeButton.setBackgroundImage(UIImage(named:"white"), for: .disabled)
        resumeButton.setBackgroundImage(UIImage(named:"playButton"), for: .normal)
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
       
        cprTimer.timer?.invalidate()
        epiTimer.timer?.invalidate()
        cprLabel.text="00:00"
        epiLabel.text = "Epinephrine 1mg"
       
        cprButton.configureCheck()
        epiButton.configureCheck()
        intButton.configureCheck()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        cprTimer.invalidate()
        cprTimer.time = 120
        epiTimer.invalidate()
        epiTimer.time = 120
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        resumeButton.isEnabled = false
        cprListLabel.reset()
        intLabel.reset()
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
            globalCounter.globalReset()
            cprCountGlobal.text = "CPR: 0"
            epiCountGlobal.text = "Epi: 0"
            shockCountGlobal.text = "Defib: 0"
            timeCountGlobal.text = "00:00"
            cprButton.configureCheck()
            epiButton.configureCheck()
            intButton.configureCheck()
      
            cprTimer.timer?.invalidate()
            epiTimer.timer?.invalidate()
            epiLabel.text = "Epinephrine 1mg"
            cprLabel.text = "00:00"
            resumeButton.isEnabled = false
            cprListLabel.reset()
            intLabel.reset()
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
        
        if epiTimer.timer?.isValid == false && epiTimer.time < 120 {
            epiTimer.startTimer()
            
        }
        
        globalCounter.startGlobalTime()
        resetButton.setTitle("Stop", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
    }

    
//    UI Buttons
        
        
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalReset()  
        globalCounter.globalTimer.invalidate()
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        
        cprCountGlobal.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockCountGlobal.text = "Defib: 0"
        timeCountGlobal.text = "00:00"
        
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
    
    
    
    @IBAction func htPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "htCauses")
        self.present(vc, animated: true)
    }
    
    
    
    
//    MARK: Checklist
    
    @IBAction func cprPressed(_ sender: Any) {
        
        cprButton.checkOffOn()
        cprListLabel.fadeLabel()
        
        if cprTimer.timer?.isValid ?? false {
            cprTimer.invalidate()
            cprLabel.text = "00:00"
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
        }
        
        else if cprTimer.timer?.isValid == false && cprTimer.time == 0 {
            cprTimer.time = 120
            cprLabel.text = "00:00"
        }
        
        else{
            cprTimer.time = 120
            cprTimer.startTimer()
            globalCounter.cprCountGlobal+=1
            cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
            cprVibration.time = 0
            cprVibration.startVibration()
//            cprAlert.sendAlert(VC: self)
        }
    
        
    }
    
    
    
    
    @IBAction func epiPressed(_ sender: Any) {
        epiButton.checkOffOn()
        
        if epiTimer.timer?.isValid ?? false {
            epiTimer.invalidate()
            epiLabel.text = "Epinephrine 1mg"
        }
        
        else if epiTimer.timer?.isValid == false && epiTimer.time == 0 {
            epiTimer.time = 120
            epiLabel.text = "Epinephrine 1mg"
        }
        
        else{
            epiTimer.time = 120
            epiTimer.startTimer()
            globalCounter.epiCountGlobal+=1
            epiCountGlobal.text = "Epi: \(globalCounter.epiCountGlobal)"}
        
    }
    
    
    @IBAction func intPressed(_ sender: Any) {
        intButton.checkOffOn()
        intLabel.fadeLabel()
    }
    
    
    
    

}
