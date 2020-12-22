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
    
    
    var cprSeconds = 0
    var epiSeconds = 0
    var timer:Timer!
    var epiTimer:Timer!
    
//    MARK: GLOBAL VARIABLES
    
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    
    

//    MARK:  Code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalCounter.globalTimer?.invalidate()
        startGlobalTime()
        noButton.layer.cornerRadius = 8
        yesButton.layer.cornerRadius = 8
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
        
    }
    
    
//    GLOBAL Timer
    
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
    
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        var minutes: Int
        var seconds: Int
        minutes = (globalCounter.globalTimeCounter % 3600) / 60
        seconds = (globalCounter.globalTimeCounter % 3600) % 60
        timeCountGlobal.text = String(format: "Total Time: %02d:%02d", minutes, seconds)
        globalCounter.globalTimer?.invalidate()
        timer?.invalidate()
        cprLabel.text="Start CPR"
        startGlobalTime()
        cprButton.configureCheck()
        epiButton.configureCheck()
        intButton.configureCheck()
        shockButton.configureCheck()
    }
    
    
    
    @IBAction func resetTapped(_ sender: Any) {
        
        
        if globalCounter.globalTimer?.isValid ?? false {
            globalCounter.globalTimer?.invalidate()
            resetButton.setTitle("Reset", for: .normal)
            resetButton.setTitleColor(.systemBlue, for: .normal)
            timer?.invalidate()
            epiTimer?.invalidate()
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
            epiButton.configureCheck()
            intButton.configureCheck()
            shockButton.configureCheck()
            timer?.invalidate()
            epiTimer?.invalidate()
            epiLabel.text = "Epinephrine 1mg"
            cprLabel.text = "Start CPR"}
        
        else {
            startGlobalTime()
            resetButton.setTitle("Stop", for: .normal)
            resetButton.setTitleColor(.systemRed, for: .normal)
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
        self.navigationController?.popToRootViewController(animated: true)
    }
    

    @IBAction func noPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "asystolePEA") as! asystolePEA
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func cprPressed(_ sender: Any) {
        
        cprButton.checkOffOn()
        
        
        if timer?.isValid ?? false {
            timer.invalidate()
            cprLabel.text = "Start CPR"
        }
        
        else{
            cprSeconds = 0
            startCPR()
            globalCounter.cprCountGlobal+=1
            cprCountGlobal.text = "CPR:\(globalCounter.cprCountGlobal)"
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
        
        
        if epiTimer?.isValid ?? false {
            epiTimer.invalidate()
            epiLabel.text = "Epinephrine 1mg"
        }
        
        else{
            epiSeconds = 0
            startEpi()
            globalCounter.epiCountGlobal+=1
            epiCountGlobal.text = "Epi:\(globalCounter.epiCountGlobal)"}
}
    
    
    @IBAction func intPressed(_ sender: Any) {
        intButton.checkOffOn()
    }
    
    
    
    
    
    
    
//    MARK: Timer set up
    
    func startEpi(){
        epiTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countupEpi), userInfo: nil, repeats: true)
    }
    
    
    @objc func countupEpi() {
        epiSeconds += 1
        var minutes: Int
        var seconds: Int
        minutes = (epiSeconds % 3600) / 60
        seconds = (epiSeconds % 3600) % 60
        epiLabel.text = String(format: "Epi: %02d:%02d", minutes, seconds)
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
