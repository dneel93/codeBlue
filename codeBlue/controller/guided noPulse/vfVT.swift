//
//  vfVT.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/3/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class vfVT: UIViewController {

    @IBOutlet var cprButton: UIButton!
    @IBOutlet var accessButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    
    @IBOutlet weak var newReset: UIButton!
    
    
    
    
    
    @IBOutlet weak var cprListLabel: UILabel!
    @IBOutlet weak var accessLabel: UILabel!
    
//    MARK: Bottom Buttons
    @IBOutlet weak var roscButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var rolesButton: UIButton!
    
    @IBOutlet weak var htCauses: UIButton!
    
// MARK: Timer outlets
    private let cprTimer = timerClass(type: "CPR")
    private let cprVibration = cprVibrationTimer()
    
    
//    MARK: GLOBAL VARIABLES
    
    @IBOutlet var cprGlobalCount: UILabel!
    @IBOutlet var shockGlobalCount: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    
    
    
// MARK: code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        stopButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        
        newReset.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -4)

        algoButton.layer.cornerRadius = 8
        roscButton.layer.cornerRadius = 8
        rolesButton.layer.cornerRadius = 8
        htCauses.layer.cornerRadius = 8
       
        cprButton.configureCheck()
        accessButton.configureCheck()
        cprGlobalCount.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockGlobalCount.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprGlobalCount.configureLabel()
        shockGlobalCount.configureLabel()
        epiCountGlobal.configureLabel()
        cprTimer.setLabel(cprLabel, self, "noPulse3")
        
    }
    
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer.invalidate()
        globalCounter.startGlobalTime()
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.systemRed, for: .normal)
        
        cprGlobalCount.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockGlobalCount.text = "Defib: \(globalCounter.defibCountGlobal)"
   
        cprTimer.timer?.invalidate()
        cprLabel.text="2:00"
        
        cprButton.configureCheck()
        accessButton.configureCheck()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        cprTimer.invalidate()
        cprTimer.time = 120
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        cprListLabel.reset()
        accessLabel.reset()
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
            cprGlobalCount.text = "CPR: 0"
            epiCountGlobal.text = "Epi: 0"
            shockGlobalCount.text = "Defib: 0"
            timeCountGlobal.text = "00:00"
            cprTimer.time = 120
            
            cprButton.configureCheck()
            accessButton.configureCheck()
          
            cprTimer.timer?.invalidate()
            cprLabel.text = "2:00"
            cprListLabel.reset()
            accessLabel.reset()
            htTable.resetTable()
        
    }
    
    
    
    
    
    


    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalReset()
        cprTimer.timer?.invalidate()
        cprVibration.timer?.invalidate()
        cprVibration.time = 0

        cprGlobalCount.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockGlobalCount.text = "Defib: 0"
        timeCountGlobal.text = "00:00"
        globalCounter.globalTimer.invalidate()
        self.navigationController?.popToRootViewController(animated: true)
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
        let vc = storyboard.instantiateViewController(withIdentifier: "cardiacAlgo")
        self.present(vc, animated: true)
    }
    
    
    @IBAction func rolesPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "codeStructure")
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
    
    
    


    
//    MARK: CHECKLIST
    
    
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
            cprGlobalCount.text = "CPR: \(globalCounter.cprCountGlobal)"
            cprVibration.startVibration()
//            cprAlert.sendAlert(VC: self)
        }
        
    }
    
    
    @IBAction func accessPressed(_ sender: Any) {
        accessButton.checkOffOn()
        accessLabel.fadeLabel()
    }
    
    

   

    }
    
    

    
    

