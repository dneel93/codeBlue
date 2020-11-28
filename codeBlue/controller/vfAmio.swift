//
//  vfAmio.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/3/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class vfAmio: UIViewController {

    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var amioButton: UIButton!
    @IBOutlet var causesButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var causesInfo: UIButton!
    var cprSeconds = 0
    var timer:Timer!
    
    
//   Global Variables
    
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var resetButton: UIButton!

    @IBOutlet var timeCountGlobal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        noButton.layer.cornerRadius = 8
        yesButton.layer.cornerRadius = 8
        causesInfo.layer.cornerRadius = 8
        amioButton.configureCheck()
        cprButton.configureCheck()
        causesButton.configureCheck()
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
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
    
    
    @IBAction func homeTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
            cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
        }
        
        
    }
    
    @IBAction func amioPressed(_ sender: Any) {
        amioButton.checkOffOn()
    }
    
    
    @IBAction func causesPressed(_ sender: Any) {
        causesButton.checkOffOn()
    }
    
    
    @IBAction func causeInfoPressed(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "htCauses") as! HTcausesTableVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func yesPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "vfEpi") as! vfEpi

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func noPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "asystolePEA") as! asystolePEA
        self.navigationController?.pushViewController(vc, animated: true)
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
