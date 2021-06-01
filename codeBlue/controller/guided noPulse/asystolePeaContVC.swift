//
//  asystolePeaContVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/2/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class asystolePeaContVC: UIViewController {
   
    // MARK: Checlist outlets
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var cprButton: UIButton!
    
    @IBOutlet weak var bicarbButton: UIButton!
    @IBOutlet weak var ionsButton: UIButton!
    @IBOutlet weak var bicarbLabel: UILabel!
    @IBOutlet weak var ionsLabel: UILabel!
    
    @IBOutlet var causesButton: UIButton!
    @IBOutlet weak var htLabel: UILabel!
    
    // MARK: bottom popup button outlets
    @IBOutlet weak var roscButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var rolesButton: UIButton!
    @IBOutlet weak var htButton: UIButton!
    
    
    private let cprTimer = timerClass(type: "CPR")
    private let cprVibration = cprVibrationTimer()
    
    
    @IBOutlet weak var cprListLabel: UILabel!
    @IBOutlet weak var causesLabel: UILabel!
    
    
//    MARK: GLOBAL VARIABLES
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var timeCountGlobal: UILabel!
    @IBOutlet weak var resumeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        resetButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        
        roscButton.layer.cornerRadius = 8
        algoButton.layer.cornerRadius = 8
        rolesButton.layer.cornerRadius = 8
        htButton.layer.cornerRadius = 8
        cprButton.configureCheck()
        causesButton.configureCheck()
    
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprCountGlobal.text = "CPR:\(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi:\(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib:\(globalCounter.defibCountGlobal)"
        cprTimer.setLabel(cprLabel, self,"noPulse8")
        
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
        
        
        cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprButton.configureCheck()
        causesButton.configureCheck()
        cprTimer.timer?.invalidate()
        cprLabel.text = "2:00"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        cprTimer.invalidate()
        cprTimer.time = 0
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        resumeButton.isEnabled = false
        causesLabel.reset()
        cprListLabel.reset()
    }
    
    
    @IBAction func resetTapped(_ sender: Any) {
        
        if globalCounter.globalTimer?.isValid ?? false {
            globalCounter.globalTimer?.invalidate()
            resetButton.setTitle("Reset", for: .normal)
            resetButton.setTitleColor(.systemBlue, for: .normal)
            cprTimer.timer?.invalidate()
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
            resumeButton.isEnabled = true
        }
        
        else if globalCounter.globalTimer?.isValid == false && globalCounter.globalTimeCounter > 0 {
            
            resetButton.setTitle("Start", for: .normal)
            resetButton.setTitleColor(.systemGreen, for: .normal)
            
            globalCounter.globalReset()  
            cprVibration.timer?.invalidate()
            resumeButton.isEnabled = false
            
            cprCountGlobal.text = "CPR: 0"
            epiCountGlobal.text="Epi: 0"
            shockCountGlobal.text = "Defib: 0"
            timeCountGlobal.text = "00:00"
            cprTimer.timer?.invalidate()
            cprButton.configureCheck()
            causesButton.configureCheck()
            cprLabel.text = "00:00"
            causesLabel.reset()
            cprListLabel.reset()
            htTable.resetTable()
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
    
    
    
    

    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalReset()
        cprTimer.timer?.invalidate()
        cprTimer.time = 120
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        

        cprCountGlobal.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockCountGlobal.text = "Defib: 0"
        timeCountGlobal.text = "00:00"
        globalCounter.globalTimer?.invalidate()
        htTable.resetTable()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: Bottom popup button code 
    
    
    @IBAction func structurePressed(_ sender: Any) {
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
        let vc = storyboard.instantiateViewController(withIdentifier: "cardiacAlgo2")
        self.present(vc, animated: true)
    }
    
    
//    MARK: Checklist button actions
    
    @IBAction func cprPress(_ sender: Any) {
        
        cprButton.checkOffOn()
        cprListLabel.fadeLabel()
        
        if cprTimer.timer?.isValid ?? false {
            cprTimer.invalidate()
            cprLabel.text = "2:00"
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
        }
        
        else if cprTimer.timer?.isValid == false && cprTimer.time == 0 {
            cprTimer.time = 120
            cprLabel.text = "2:00"
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
    
    
    @IBAction func bicarbPress(_ sender: Any) {
        bicarbButton.checkOffOn()
        bicarbLabel.fadeLabel()
    }
    
    @IBAction func ionsPress(_ sender: Any) {
        ionsButton.checkOffOn()
        ionsLabel.fadeLabel()
    }
    
    
    
    @IBAction func causesPress(_ sender: Any) {
        causesButton.checkOffOn()
        causesLabel.fadeLabel()
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "htCauses")
        self.present(vc, animated: true)
    }
    
    
    
    @IBAction func htPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "htCauses")
        self.present(vc, animated: true)
    }
    
    
    
}
