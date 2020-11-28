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
        cprGlobalCount.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockGlobalCount.text = "Defib: \(globalCounter.defibCountGlobal)"
        timeCountGlobal.text = "Total Time: \(globalCounter.globalTimeCounter)"
        globalCounter.globalTimer.invalidate()
        startGlobalTime()
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        globalCounter.cprCountGlobal = 0
        globalCounter.epiCountGlobal = 0
        globalCounter.defibCountGlobal = 0
        globalCounter.globalTimeCounter=0

        cprGlobalCount.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockGlobalCount.text = "Defib: 0"
        timeCountGlobal.text = "Total Time: 00:00"
    }
    

// UI buttons
    
    @IBAction func homeTapped(_ sender: Any) {
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
        shockGlobalCount.text = "Defib:\(globalCounter.defibCountGlobal)"
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
    
    
