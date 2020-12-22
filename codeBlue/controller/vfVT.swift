//
//  vfVT.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/3/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class vfVT: UIViewController {

    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var shockButton: UIButton!
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var accessButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    var cprSeconds = 0
    var timer:Timer!
    
    
//    GLOBAL VARIABLES
    @IBOutlet var cprGlobalCount: UILabel!
    @IBOutlet var shockGlobalCount: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var resetButton: UIButton!
    
    @IBOutlet var timeCountGlobal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        noButton.layer.cornerRadius = 8
        yesButton.layer.cornerRadius = 8
        shockButton.configureCheck()
        cprButton.configureCheck()
        accessButton.configureCheck()
        cprGlobalCount.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockGlobalCount.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprGlobalCount.configureLabel()
        shockGlobalCount.configureLabel()
        epiCountGlobal.configureLabel()
        globalCounter.globalTimer?.invalidate()
        startGlobalTime()
    }
    
    
//    GLOBAL variables and timer
    
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
        cprGlobalCount.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockGlobalCount.text = "Defib: \(globalCounter.defibCountGlobal)"
        var minutes: Int
        var seconds: Int
        minutes = (globalCounter.globalTimeCounter % 3600) / 60
        seconds = (globalCounter.globalTimeCounter % 3600) % 60
        timeCountGlobal.text = String(format: "Total Time: %02d:%02d", minutes, seconds)
        globalCounter.globalTimer.invalidate()
        timer?.invalidate()
        cprLabel.text="Start CPR"
        startGlobalTime()
        shockButton.configureCheck()
        cprButton.configureCheck()
        accessButton.configureCheck()
    }
    
//    
    @IBAction func resetTapped(_ sender: Any) {
        
        if globalCounter.globalTimer?.isValid ?? false {
            globalCounter.globalTimer?.invalidate()
            resetButton.setTitle("Reset", for: .normal)
            resetButton.setTitleColor(.systemBlue, for: .normal)
            timer?.invalidate()
            
        }
        
        else if globalCounter.globalTimer?.isValid == false && globalCounter.globalTimeCounter > 0 {
            
            resetButton.setTitle("Start", for: .normal)
            resetButton.setTitleColor(.systemGreen, for: .normal)
            globalCounter.cprCountGlobal = 0
            globalCounter.epiCountGlobal = 0
            globalCounter.defibCountGlobal = 0
            globalCounter.globalTimeCounter=0

            cprGlobalCount.text = "CPR: 0"
            epiCountGlobal.text = "Epi: 0"
            shockGlobalCount.text = "Defib: 0"
            timeCountGlobal.text = "Total Time: 00:00"
            shockButton.configureCheck()
            cprButton.configureCheck()
            accessButton.configureCheck()
            shockButton.configureCheck()
            timer?.invalidate()
            cprLabel.text = "Start CPR"
       }
        
        else {
            startGlobalTime()
            resetButton.setTitle("Stop", for: .normal)
            resetButton.setTitleColor(.systemRed, for: .normal)}
        
    }
    

// UI buttons
    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.cprCountGlobal = 0
        globalCounter.epiCountGlobal = 0
        globalCounter.defibCountGlobal = 0
        globalCounter.globalTimeCounter=0

        cprGlobalCount.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockGlobalCount.text = "Defib: 0"
        timeCountGlobal.text = "Total Time: 00:00"
        globalCounter.globalTimer.invalidate()
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    

    @IBAction func yesPressed(_ sender: Any) {
    
    }
    
    @IBAction func noPressed(_ sender: Any) {
     
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "asystolePEA") as! asystolePEA
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
//    CHECKLIST
    
    @IBAction func shockPressed(_ sender: Any) {
        shockButton.checkOffOn()
        globalCounter.defibCountGlobal+=1
        shockGlobalCount.text = "Defib: \(globalCounter.defibCountGlobal)"
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
            cprGlobalCount.text = "CPR: \(globalCounter.cprCountGlobal)"
        }
        
        
    }
    
    
    @IBAction func accessPressed(_ sender: Any) {
        accessButton.checkOffOn()
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
    
    

