//
//  guidedNoPulseVC1.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit


class guidedNoPulseVC1: UIViewController {

//  CHECKLIST variables
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var o2Button: UIButton!
    @IBOutlet var defibButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    var cprSeconds = 0
    var timer:Timer!
   
//  GLOBAL VARIABLES
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    
    @IBOutlet var resetGlobalButton: UIButton!
    
    @IBOutlet var timeCountGlobal: UILabel!
    
//  YES NO BUTTON
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        globalCounter.globalTimer?.invalidate()
        startGlobalTime()
        
    }
    
//    Global timer and variables
    
    func startGlobalTime(){
        globalCounter.globalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUITime), userInfo: nil, repeats: true)
    }
    
    @objc func updateUITime() {
        globalCounter.globalTimeCounter += 1
        var minutes: Int
        var seconds: Int
        minutes = (globalCounter.globalTimeCounter % 3600) / 60
        seconds = (globalCounter.globalTimeCounter % 3600) % 60
        timeCountGlobal.text = String(format: "Total Time: %02d:%02d", minutes, seconds)
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.globalTimer.invalidate()
        startGlobalTime()
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        timer?.invalidate()
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
        }
        
        else if globalCounter.globalTimer?.isValid == false && globalCounter.globalTimeCounter > 0 {
            
            resetGlobalButton.setTitle("Start", for: .normal)
            resetGlobalButton.setTitleColor(.systemGreen, for: .normal)
            globalCounter.cprCountGlobal = 0
            globalCounter.epiCountGlobal = 0
            globalCounter.defibCountGlobal = 0
            globalCounter.globalTimeCounter = 0
            timer?.invalidate()
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
            startGlobalTime()
            resetGlobalButton.setTitle("Stop", for: .normal)
            resetGlobalButton.setTitleColor(.systemRed, for: .normal)}
        
    }
    
    
    
//    UI Buttons
    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalTimer?.invalidate()
        timer?.invalidate()
        globalCounter.globalTimeCounter = 0
        timeCountGlobal.text = "Total Time: 00:00"
        globalCounter.cprCountGlobal = 0
        globalCounter.epiCountGlobal = 0
        globalCounter.defibCountGlobal = 0
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
//    CHECKLIST Items

    @IBAction func cprPress(_ sender: Any) {
        cprButton.checkOffOn()
        
        
        if timer?.isValid ?? false {
            timer.invalidate()
            cprLabel.text = "Start CPR"
        }
        
        else{
            cprSeconds = 0
            startCPR()
            globalCounter.cprCountGlobal+=1
            cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
        }
        
    }
    
    
    @IBAction func o2Press(_ sender: Any) {
    
        o2Button.checkOffOn()
    }
        
    
    
    
    @IBAction func defibPress(_ sender: Any) {
        defibButton.checkOffOn()
    }

    
    func startCPR(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
    }
    
    
    @objc func countup() {
        cprSeconds += 1
        var minutes: Int
        var seconds: Int
        minutes = (cprSeconds % 3600) / 60
        seconds = (cprSeconds % 3600) % 60
        cprLabel.text = String(format: "CPR: %02d:%02d", minutes, seconds)
    }
    
    
 

}
    
    
    
    

    
   
   

    
    

    

