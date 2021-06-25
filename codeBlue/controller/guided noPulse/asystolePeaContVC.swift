//
//  asystolePeaContVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/2/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class asystolePeaContVC: UIViewController {
   
    // MARK: Checlist outlets
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var cprButton: UIButton!
    
    @IBOutlet weak var bicarbButton: UIButton!
    @IBOutlet weak var ionsButton: UIButton!
    @IBOutlet weak var bicarbLabel: UILabel!
    @IBOutlet weak var ionsLabel: UILabel!
    
    @IBOutlet var causesButton: UIButton!
    @IBOutlet weak var htLabel: UILabel!
    
    // MARK: bottom popup button outlets
    @IBOutlet weak var roscButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var rolesButton: UIButton!
    @IBOutlet weak var htButton: UIButton!
    
    
    private let cprVibration = cprVibrationTimer()
    
    
    @IBOutlet weak var cprListLabel: UILabel!
    @IBOutlet weak var causesLabel: UILabel!
    
    @IBOutlet weak var totalReset: UIBarButtonItem!
    
//    MARK: GLOBAL VARIABLES
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var timeCountGlobal: UILabel!
    @IBOutlet weak var newReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        stopButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        newReset.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -4)
        
        roscButton.layer.cornerRadius = 8
        algoButton.layer.cornerRadius = 8
        rolesButton.layer.cornerRadius = 8
        htButton.layer.cornerRadius = 8
        cprButton.configureCheckCpr()
        cprListLabel.configureCprListLabel()
        causesButton.configureCheck()
        bicarbButton.configureCheck()
        ionsButton.configureCheck()
    
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprCountGlobal.text = "CPR:\(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi:\(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib:\(globalCounter.defibCountGlobal)"
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse8")
        stopButton.setStopText()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.continueGlobalTime()
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse8")
        globalCprTimer.continueCpr()
        stopButton.setStopText()
        cprButton.configureCheckCpr()
        
        cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        
        causesButton.configureCheck()
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        
        causesLabel.reset()
        cprListLabel.reset()
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        stopButton.stopButtonProp(cprVibration: cprVibration, cprButton: cprButton, cprListLabel: cprListLabel, VC:self)

    }
    
    
    
    @IBAction func resetPress(_ sender: Any) {

        newReset.resetCPRonly(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel, cprButton: cprButton,cprCountGlobal: cprCountGlobal)}
    
    
    @IBAction func totalResetPress(_ sender: Any) {
    
        totalReset.totalReset(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel)
        
        //        Reset everthing
                    cprCountGlobal.text = "CPR: 0"
                    epiCountGlobal.text = "Epi: 0"
                    shockCountGlobal.text = "Defib: 0"
                    timeCountGlobal.text = "00:00"
                    
                    cprButton.configureCheckCpr()
                    causesButton.configureCheck()
                    bicarbButton.configureCheck()
                    ionsButton.configureCheck()
                    ionsLabel.reset()
                    cprListLabel.reset()
                    bicarbLabel.reset()
                    causesLabel.reset()
    
    }
    
            

        
    
    
    
    
   
    
    
    

    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalReset()
        globalCprTimer.timer?.invalidate()
        globalCprTimer.time = 120
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        

        cprCountGlobal.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockCountGlobal.text = "Defib: 0"
        timeCountGlobal.text = "00:00"
        globalCounter.globalTimer?.invalidate()
        htTable.resetTable()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: Bottom popup button code 
    
    
    @IBAction func structurePressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "codeStructure")
        self.present(vc, animated: true)
    }
    
    @IBAction func roscPress(_ sender: Any) {
        globalCounter.globalTimer?.invalidate()
        stopButton.setTitle("Reset", for: .normal)
        stopButton.setTitleColor(.systemBlue, for: .normal)
        globalCprTimer.invalidate()
        globalEpiTimer.invalidate()
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        
        let storyboard = UIStoryboard(name: "Algos", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "rosc")
        self.present(vc, animated: true)
    }
    
    @IBAction func algoPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "cardiacAlgo2")
        self.present(vc, animated: true)
    }
    
    
//    MARK: Checklist button actions
    
    @IBAction func cprPress(_ sender: Any) {
        cprButton.checkOffOn()
        cprListLabel.fadeLabel()
        cprButton.cprButtonProperties(cprLabel: cprLabel, cprVibration: cprVibration, cprCountGlobal: cprCountGlobal, cprListLabel: cprListLabel, VC:self)
        stopButton.setStopText()
    }
    
    
    @IBAction func bicarbPress(_ sender: Any) {
        bicarbButton.checkOffOn()
        bicarbLabel.fadeLabel()
    }
    
    @IBAction func ionsPress(_ sender: Any) {
        ionsButton.checkOffOn()
        ionsLabel.fadeLabel()
    }
    
    
    
    @IBAction func causesPress(_ sender: Any) {
        causesButton.checkOffOn()
        causesLabel.fadeLabel()
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "htCauses")
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
    
    
    
}
