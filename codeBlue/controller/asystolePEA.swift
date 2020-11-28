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
    
    var cprSeconds = 0
    var timer:Timer!
    
    
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
        globalCounter.globalTimer.invalidate()
        startGlobalTime()
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
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        timeCountGlobal.text = "Total Time: \(globalCounter.globalTimeCounter)"
        globalCounter.globalTimer.invalidate()
        startGlobalTime()
    }
    
    
    @IBAction func resetTapped(_ sender: Any) {
        globalCounter.cprCountGlobal = 0
        globalCounter.epiCountGlobal = 0
        globalCounter.defibCountGlobal = 0
        globalCounter.globalTimeCounter=0

        cprCountGlobal.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockCountGlobal.text = "Defib: 0"
        timeCountGlobal.text = "Total Time: 00:00"
    }
    
    
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
    
    @IBAction func homeTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    @IBAction func accessPress(_ sender: Any) {
        accessButton.checkOffOn()
    }
    
    
    
    @IBAction func epiPressed(_ sender: Any) {
        if epiButton.isSelected == true{
            epiButton.configureCheck()}
        
        else{
            epiButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            epiButton.isSelected = true
            globalCounter.epiCountGlobal+=1
            epiCountGlobal.text = "Epi:\(globalCounter.epiCountGlobal)"
        }}
    
    
    
    @IBAction func intPressed(_ sender: Any) {
        intubationButton.checkOffOn()
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
