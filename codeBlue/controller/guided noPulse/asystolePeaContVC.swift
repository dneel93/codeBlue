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
    @IBOutlet weak var logButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        
        let color = UIColor(red: 241/255, green: 248/255, blue: 254/255, alpha: 1.0)
        roscButton.configure(title:"ROSC", colors: color)
        algoButton.configure(title: "Algo",colors: color)
        rolesButton.configure(title: "Roles",colors: color)
        htButton.configure(title: "H&T", colors:color)
        
        stopButton.setStopText()
        newReset.configureShadow()
        logButton.configureShadow()
        
        
        
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
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.continueGlobalTime()
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse8")
        globalCprTimer.continueCpr()
        globalEpiTimer.setLabelVC1(epiCountGlobal, self)
        globalEpiTimer.continueEpiTimer()
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
        
        /* globalCounter.globalTimer?.invalidate()
        stopButton.setTitle("Reset", for: .normal)
        stopButton.setTitleColor(.systemBlue, for: .normal)
        globalCprTimer.invalidate()
        globalEpiTimer.invalidate()
        cprVibration.timer?.invalidate()
        cprVibration.time = 0 */
        
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
        
        if bicarbButton.isSelected == true{
            let time = eventLog.getDate()
            eventLog.eventTime.append("Bicarb 1amp: \(time)")
        }
    }
    
    @IBAction func ionsPress(_ sender: Any) {
        ionsButton.checkOffOn()
        ionsLabel.fadeLabel()
        
        if ionsButton.isSelected == true{
            let time = eventLog.getDate()
            eventLog.eventTime.append("Mg/Ca (2g) given: \(time)")
        }
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
