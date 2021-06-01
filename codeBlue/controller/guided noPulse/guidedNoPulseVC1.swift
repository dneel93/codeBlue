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
    
    @IBOutlet weak var newReset: UIButton!
    
    
    
    
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

    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    
    @IBOutlet weak var logButton: UIButton!
    
    
//    MARK: Bottom popup buttons
    @IBOutlet weak var roscButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var rolesButton: UIButton!
    @IBOutlet weak var causesButton: UIButton!
    
    
// MARK: UI Code 
    
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
        
        stopButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        
        newReset.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -4)
        
        
        
        
        assignButton.configureCheck()
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprTimer.setLabel(cprLabel, self, "noPulse1")
        


    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        cprTimer.invalidate()
        cprTimer.time = 120
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
      
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
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.systemRed, for: .normal)
        
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprTimer.timer?.invalidate()
        cprLabel.text="2:00"
        cprButton.configureCheck()
        o2Button.configureCheck()
        defibButton.configureCheck()
        assignButton.configureCheck()
        
        htTable.resetTable()
        
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
            o2Button.configureCheck()
            defibButton.configureCheck()
            assignButton.configureCheck()
            assignLabel.reset()
            cprListLabel.reset()
            o2Label.reset()
            defibLabel.reset()
          
            cprTimer.timer?.invalidate()
            cprLabel.text = "2:00"
            cprListLabel.reset()
            
            htTable.resetTable()
        
    }
    
    
    
    

    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalTimer?.invalidate()
        cprTimer.timer?.invalidate()
        globalCounter.globalTimeCounter = 0
        timeCountGlobal.text = "00:00"
        globalCounter.globalReset()  
        cprVibration.time=0
        cprVibration.timer?.invalidate()
        htTable.resetTable()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
// MARK: Bottom button actions
    
    @IBAction func rolesPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "codeStructure")
        self.present(vc, animated: true)
    }
    
    
    @IBAction func roscPress(_ sender: Any) {
        globalCounter.globalTimer?.invalidate()
        
        cprTimer.invalidate()
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        
        
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
    
    
    @IBAction func logPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "eventLog")
        self.present(vc, animated: true)
        
    }
    
    
    
    
    

    
//    MARK: Checklist Actions
    
    
    
    @IBAction func assignPress(_ sender: Any) {
        assignLabel.fadeLabel()
        assignButton.checkOffOn()
        
    }
    
    @IBAction func cprPress(_ sender: Any) {
        cprButton.checkOffOn()
        cprListLabel.fadeLabel()
       


//       TIMER LOGIC for CPR (timer and vibration/alert)
        
        if cprTimer.timer?.isValid ?? false {
            cprTimer.invalidate()
            cprTimer.time = 120
            cprVibration.timer?.invalidate()
            cprVibration.time=120
            cprLabel.text = "2:00"
        }
        
        else if cprTimer.timer?.isValid == false && cprTimer.time < 120 {
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
    
    
  
    
    
    
    
    

    
}
    
    
    
    

    
   
   

    
    

    

