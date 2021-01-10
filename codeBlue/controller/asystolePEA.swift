//
//  asystolePEA.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/2/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class asystolePEA: UIViewController {

    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var accessButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var epiButton: UIButton!
    @IBOutlet var intubationButton: UIButton!
    @IBOutlet var epiLabel: UILabel!
    
    
    let cprTimer = timerLogic(type:"CPR")
    let epiTimer = timerLogic(type:"Epi")
    
    
//    GLOBAL VARIABLES
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noButton.configure(title: "No")
        yesButton.configure(title: "Yes")
        cprButton.configureCheck()
        accessButton.configureCheck()
        epiButton.configureCheck()
        intubationButton.configureCheck()
        cprCountGlobal.text = "CPR:\(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi:\(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib:\(globalCounter.defibCountGlobal)"
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        globalCounter.globalTimer?.invalidate()
        startGlobalTime()
        cprTimer.setLabel(cprLabel)
        epiTimer.setLabel(epiLabel)
        
    }
    
    
    //    GLOBAL timers
        
        func startGlobalTime(){
            globalCounter.globalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUITime), userInfo: nil, repeats: true)
        }
        
        @objc func updateUITime() {
            globalCounter.globalTimeCounter+=1
            var minutes: Int
            var seconds: Int
            minutes = (globalCounter.globalTimeCounter % 3600) / 60
            seconds = (globalCounter.globalTimeCounter % 3600) % 60
            timeCountGlobal.text = String(format: "Total Time: %02d:%02d", minutes, seconds)
    }
        
    
//    Code
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        globalCounter.globalTimer.invalidate()
        startGlobalTime()
        cprButton.configureCheck()
        accessButton.configureCheck()
        epiButton.configureCheck()
        intubationButton.configureCheck()
    }
    
    
    @IBAction func resetTapped(_ sender: Any) {
        
        if globalCounter.globalTimer?.isValid ?? false {
            globalCounter.globalTimer?.invalidate()
            resetButton.setTitle("Reset", for: .normal)
            resetButton.setTitleColor(.systemBlue, for: .normal)
            cprTimer.invalidate()
            epiTimer.invalidate()
        }
        
        else if globalCounter.globalTimer?.isValid == false && globalCounter.globalTimeCounter > 0 {
            
            resetButton.setTitle("Start", for: .normal)
            resetButton.setTitleColor(.systemGreen, for: .normal)
            
            globalCounter.cprCountGlobal = 0
            globalCounter.epiCountGlobal = 0
            globalCounter.defibCountGlobal = 0
            globalCounter.globalTimeCounter=0

            cprCountGlobal.text = "CPR: 0"
            epiCountGlobal.text = "Epi: 0"
            shockCountGlobal.text = "Defib: 0"
            timeCountGlobal.text = "Total Time: 00:00"
            cprButton.configureCheck()
            accessButton.configureCheck()
            epiButton.configureCheck()
            intubationButton.configureCheck()
            cprTimer.invalidate()
            epiTimer.invalidate()
            cprLabel.text = "Start CPR"
            epiLabel.text = "Epinephrine 1mg"
       }
        
        else {
            startGlobalTime()
            resetButton.setTitle("Stop", for: .normal)
            resetButton.setTitleColor(.systemRed, for: .normal)}
        
    }
    
//    CHECKLIST
    
    @IBAction func cprPress(_ sender: Any) {
        cprButton.checkOffOn()
        
        if cprTimer.timer?.isValid ?? false {
            cprTimer.invalidate()
            cprLabel.text = "Start CPR"
        }
        
        else{
            cprTimer.time = 0
            cprTimer.startTimer()
            globalCounter.cprCountGlobal+=1
            cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
        }
    }
    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.cprCountGlobal = 0
        globalCounter.epiCountGlobal = 0
        globalCounter.defibCountGlobal = 0
        globalCounter.globalTimeCounter=0

        cprCountGlobal.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockCountGlobal.text = "Defib: 0"
        timeCountGlobal.text = "Total Time: 00:00"
        globalCounter.globalTimer.invalidate()
        cprTimer.invalidate()
        epiTimer.invalidate()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    @IBAction func accessPress(_ sender: Any) {
        accessButton.checkOffOn()
    }
    
    
    
    @IBAction func epiPressed(_ sender: Any) {
        epiButton.checkOffOn()
        
        if epiTimer.timer?.isValid ?? false {
            epiTimer.invalidate()
            epiLabel.text = "Epinephrine 1mg"
        }
        
        else{
            epiTimer.time = 0
            epiTimer.startTimer()
            globalCounter.epiCountGlobal+=1
            epiCountGlobal.text = "Epi: \(globalCounter.epiCountGlobal)"
        }
        
        
        }
    
    
    @IBAction func intPressed(_ sender: Any) {
        intubationButton.checkOffOn()
    }
    
    

    

    


}
