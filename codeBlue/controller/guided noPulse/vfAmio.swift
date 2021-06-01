//
//  vfAmio.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/3/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class vfAmio: UIViewController {

    
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var amioButton: UIButton!
    @IBOutlet var causesButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet weak var epiButton: UIButton!
    
    @IBOutlet weak var epiLabel: UILabel!
    
    
// MARK: labels

    @IBOutlet weak var cprListLabel: UILabel!
    @IBOutlet weak var amioLabel: UILabel!
    @IBOutlet weak var causesLabel: UILabel!
    
    
//    MARK: bottom buttons
    @IBOutlet weak var rolesButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var roscButton: UIButton!
    
    @IBOutlet weak var htButton: UIButton!
    
    
    
//    MARK: Timers
    private let cprTimer = timerClass(type: "CPR")
    private let cprVibration = cprVibrationTimer()
    private let epiTimer = timerClass(type: "Epi")
    
//   MARK: Global Variables
    
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    @IBOutlet weak var newReset: UIButton!
    
    
//  MARK: Code
    
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
        amioButton.configureCheck()
        cprButton.configureCheck()
        causesButton.configureCheck()
        epiButton.configureCheck()
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprTimer.setLabel(cprLabel,self,"noPulse9")
        epiTimer.setLabel(epiLabel, self, "noPulse9")
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer.invalidate()
        globalCounter.startGlobalTime()
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.systemRed, for: .normal)
        
        
        cprTimer.timer?.invalidate()
        cprLabel.text="2:00"
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        
        amioButton.configureCheck()
        cprButton.configureCheck()
        causesButton.configureCheck()
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        cprTimer.invalidate()
        cprTimer.time = 0
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        cprListLabel.reset()
        amioLabel.reset()
        causesLabel.reset()
    }


    // UI buttons
    
    @IBAction func stopTapped(_ sender: Any) {
        //      Stop is pressed on running timer
                if globalCounter.globalTimer?.isValid ?? false {
                    globalCounter.globalTimer?.invalidate()
                    
                    cprTimer.timer?.invalidate()
                    cprVibration.timer?.invalidate()
                    epiTimer.invalidate()
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
                    
                    if epiTimer.timer?.isValid == false && epiTimer.time < 180 {
                        epiTimer.startTimer()}
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
            epiTimer.invalidate()
            
//        Reset everthing
            globalCounter.globalReset()
            cprCountGlobal.text = "CPR: 0"
            epiCountGlobal.text = "Epi: 0"
            shockCountGlobal.text = "Defib: 0"
            timeCountGlobal.text = "00:00"
            cprTimer.time = 120
            epiTimer.time = 180
            
            cprButton.configureCheck()
            cprButton.configureCheck()
            amioButton.configureCheck()
            causesButton.configureCheck()
            epiButton.configureCheck()
            cprListLabel.reset()
            causesLabel.reset()
            amioLabel.reset()
          
            cprTimer.timer?.invalidate()
            cprLabel.text = "2:00"
            epiLabel.text = "Epinephrine 1mg"
            cprListLabel.reset()
            htTable.resetTable()
    }
    
    
    
    
    
    
    
    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalReset()
        globalCounter.globalTimer?.invalidate()
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        
        cprCountGlobal.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockCountGlobal.text = "Defib: 0"
        timeCountGlobal.text = "00:00"
        htTable.resetTable()
        
        cprTimer.timer?.invalidate()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
//    MARK: Top button functions
    
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
        let vc = storyboard.instantiateViewController(withIdentifier: "cardiacAlgo")
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
            cprTimer.time = 120
            cprLabel.text = "2:00"
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
        }
        
        else if cprTimer.timer?.isValid == false && cprTimer.time < 120{
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
    
    @IBAction func amioPressed(_ sender: Any) {
        amioButton.checkOffOn()
        amioLabel.fadeLabel()
    }
    
    
    
    @IBAction func epiPressed(_ sender: Any) {
        epiButton.checkOffOn()
        
        if epiTimer.timer?.isValid ?? false {
            epiTimer.invalidate()
            epiTimer.time = 180
            epiLabel.text = "Epinephrine 1mg"
        }
        
        else if epiTimer.timer?.isValid == false && epiTimer.time < 180 {
            epiTimer.time = 180
            epiLabel.text = "Epinephrine 1mmg"
        }
        
        else{
            epiTimer.time = 180
            epiTimer.startTimer()
            globalCounter.epiCountGlobal+=1
            epiCountGlobal.text = "Epi: \(globalCounter.epiCountGlobal)"}
        
    }
    
    
    
    
    @IBAction func causesPressed(_ sender: Any) {
        causesButton.checkOffOn()
        causesLabel.fadeLabel()
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
