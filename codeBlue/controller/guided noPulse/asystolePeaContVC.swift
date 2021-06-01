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
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var timeCountGlobal: UILabel!
    @IBOutlet weak var newReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        stopButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        newReset.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -4)
        
        roscButton.layer.cornerRadius = 8
        algoButton.layer.cornerRadius = 8
        rolesButton.layer.cornerRadius = 8
        htButton.layer.cornerRadius = 8
        cprButton.configureCheck()
        causesButton.configureCheck()
        bicarbButton.configureCheck()
        ionsButton.configureCheck()
    
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprCountGlobal.text = "CPR:\(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi:\(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib:\(globalCounter.defibCountGlobal)"
        cprTimer.setLabel(cprLabel, self,"noPulse8")
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.systemRed, for: .normal)
        
        
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
        
        causesLabel.reset()
        cprListLabel.reset()
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        //      Stop is pressed on running timer
                if globalCounter.globalTimer?.isValid ?? false {
                    globalCounter.globalTimer?.invalidate()
                    
                    cprTimer.timer?.invalidate()
                    cprVibration.timer?.invalidate()
                    cprVibration.time = 0
                    stopButton.setTitle("Resume", for: .normal)
                    stopButton.setTitleColor(.systemIndigo, for: .normal)
                }
                
        //    Resume is pressed on stopped timer
                else {
//                 Resume stopped timers
                    globalCounter.startGlobalTime()
                    if cprTimer.timer?.isValid == false && cprTimer.time < 120 {
                        cprTimer.startTimer()}
//                Configure button
                    stopButton.setTitle("Stop", for: .normal)
                    stopButton.setTitleColor(.systemRed, for: .normal)
                }}
    
    

        

            
    
    
    @IBAction func resetPress(_ sender: Any) {

//        change stop button color
            stopButton.setTitle("Start", for: .normal)
            stopButton.setTitleColor(.systemGreen, for: .normal)
            
//        stop timers
            globalCounter.globalTimer?.invalidate()
            cprTimer.timer?.invalidate()
            cprVibration.timer?.invalidate()
            
//        Reset everthing
            globalCounter.globalReset()
            cprCountGlobal.text = "CPR: 0"
            epiCountGlobal.text = "Epi: 0"
            shockCountGlobal.text = "Defib: 0"
            timeCountGlobal.text = "00:00"
            cprTimer.time = 120
            
            cprButton.configureCheck()
            causesButton.configureCheck()
            bicarbButton.configureCheck()
            ionsButton.configureCheck()
            ionsLabel.reset()
            cprListLabel.reset()
            bicarbLabel.reset()
            causesLabel.reset()
          
            cprTimer.timer?.invalidate()
            cprLabel.text = "2:00"
            
            htTable.resetTable()
        
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
        stopButton.setTitle("Reset", for: .normal)
        stopButton.setTitleColor(.systemBlue, for: .normal)
        cprTimer.invalidate()
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        
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
            cprTimer.time = 120
            cprLabel.text = "2:00"
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
        }
        
        else if cprTimer.timer?.isValid == false && cprTimer.time < 120 {
            cprTimer.time = 120
            cprLabel.text = "2:00"
            cprVibration.time=0
            cprVibration.timer?.invalidate()
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
    
    @IBAction func logPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "eventLog")
        self.present(vc, animated: true)
        
    }
    
    
    
}
