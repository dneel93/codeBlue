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
    private let cprVibration = cprVibrationTimer()
    
    
//    MARK: GLOBAL VARIABLES
    
    @IBOutlet var cprGlobalCount: UILabel!
    @IBOutlet var shockGlobalCount: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    @IBOutlet weak var totalReset: UIBarButtonItem!
    
    
    
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
        cprListLabel.configureCprListLabel()
        cprButton.configureCheckCpr()
        accessButton.configureCheck()
        cprGlobalCount.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockGlobalCount.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprGlobalCount.configureLabel()
        shockGlobalCount.configureLabel()
        epiCountGlobal.configureLabel()
        
        globalCprTimer.setCprLabel(cprLabel, cprGlobalCount, self, "noPulse3")
        stopButton.setStopText()
    }
    
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.continueGlobalTime()
        globalCprTimer.setCprLabel(cprLabel, cprGlobalCount, self, "noPulse3")
        globalCprTimer.continueCpr()
        
        cprGlobalCount.text = "CPR:  \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockGlobalCount.text = "Defib: \(globalCounter.defibCountGlobal)"
   
        stopButton.setStopText()
        cprButton.configureCheckCpr()
        accessButton.configureCheck()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
       
    }
    
    
    @IBAction func stopTapped(_ sender: Any) {
        stopButton.stopButtonProp(cprVibration: cprVibration, cprButton: cprButton, cprListLabel: cprListLabel)
    }

    
    @IBAction func resetPress(_ sender: Any) {

        newReset.resetCPRonly(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel, cprButton: cprButton, cprCountGlobal: cprGlobalCount)}
    
    
    @IBAction func totalResetPress(_ sender: Any) {
    
        totalReset.totalReset(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel)
        
        //        Reset everthing
                    cprGlobalCount.text = "CPR: 0"
                    epiCountGlobal.text = "Epi: 0"
                    shockGlobalCount.text = "Defib: 0"
                    timeCountGlobal.text = "00:00"
                    
                    cprButton.configureCheck()
                    accessButton.configureCheck()
                    accessLabel.reset()
    }
    
            

            
        
    
    
    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalReset()
        globalCprTimer.timer?.invalidate()
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
    
        globalCprTimer.invalidate()
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
        cprButton.cprButtonProperties(cprLabel: cprLabel, cprVibration: cprVibration, cprCountGlobal: cprGlobalCount, cprListLabel: cprListLabel)
        stopButton.setStopText()
    }
    
    
    @IBAction func accessPressed(_ sender: Any) {
        accessButton.checkOffOn()
        accessLabel.fadeLabel()
    }
    
    

   

    }
    
    

    
    

