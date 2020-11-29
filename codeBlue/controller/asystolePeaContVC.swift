//
//  asystolePeaContVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/2/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class asystolePeaContVC: UIViewController {
   
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var cprButton: UIButton!
  
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    
    @IBOutlet var causesButton: UIButton!
    
    @IBOutlet var htButton: UIButton!
    var cprSeconds = 0
    var timer:Timer!
    
//    GLOBAL VARIABLES
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var timeCountGlobal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noButton.configure(title: "No")
        yesButton.configure(title: "Yes")
        cprButton.configureCheck()
        causesButton.configureCheck()
        htButton.layer.cornerRadius = 8
        globalCounter.globalTimer.invalidate()
        startGlobalTime()
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprCountGlobal.text = "CPR:\(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi:\(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib:\(globalCounter.defibCountGlobal)"
    }
    
    
    //    GLOBAL variables and timer
        
        func startGlobalTime(){
            globalCounter.globalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUITime), userInfo: nil, repeats: true)
        }
        
        @objc func updateUITime() {
            globalCounter.globalTimeCounter+=1
            timeCountGlobal.text = "Total Time: \(globalCounter.globalTimeCounter)"
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        var minutes: Int
        var seconds: Int
        minutes = (globalCounter.globalTimeCounter % 3600) / 60
        seconds = (globalCounter.globalTimeCounter % 3600) % 60
        timeCountGlobal.text = String(format: "Total Time: %02d:%02d", minutes, seconds)
        globalCounter.globalTimer.invalidate()
        startGlobalTime()
        cprButton.configureCheck()
        causesButton.configureCheck()
    }
    
    
    @IBAction func resetTapped(_ sender: Any) {
        globalCounter.cprCountGlobal = 0
        globalCounter.epiCountGlobal = 0
        globalCounter.defibCountGlobal = 0
        globalCounter.globalTimeCounter=0
        
        cprCountGlobal.text = "CPR: 0"
        epiCountGlobal.text="Epi: 0"
        shockCountGlobal.text = "Defib: 0"
        timeCountGlobal.text = "Total Time: 00:00"
        timer.invalidate()
        cprButton.configureCheck()
        causesButton.configureCheck()
        cprLabel.text = "Start CPR"
    }
    
    
//    UI BUTTONS
    
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
    
    
    
//    CHECKLIST
    
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
            cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        }
        
    }
    
    
    @IBAction func causesPress(_ sender: Any) {
        causesButton.checkOffOn()
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
    

    @IBAction func noPressed(_ sender: Any) {
    
        if let viewController = UIStoryboard(name: "guidedNoPulse", bundle: nil).instantiateViewController(withIdentifier: "asystolePEA") as? asystolePEA {
            navigationController?.pushViewController(viewController, animated: true)}}
    
    
    
    @IBAction func yesPressed(_ sender: Any) {
    
    }
    
}
