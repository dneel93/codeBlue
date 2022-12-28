//
//  asystolePEA.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/2/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class asystolePEA: UIViewController {
    
    // MARK: Checklist outlets

    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var accessButton: UIButton!
    @IBOutlet var epiButton: UIButton!
    @IBOutlet var intubationButton: UIButton!
    @IBOutlet var epiLabel: UILabel!
  
    @IBOutlet weak var intLabel: UILabel!
    @IBOutlet weak var accessLabel: UILabel!
    @IBOutlet weak var cprListLabel: UILabel!
    
    
    // MARK: Bottom popup button outlets
    @IBOutlet weak var roscButton: UIButton!
    @IBOutlet weak var rolesButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var htButton: UIButton!
    @IBOutlet weak var logButton: UIButton!
    
    @IBOutlet weak var totalReset: UIBarButtonItem!
    
    
    // MARK: Timers initialize
    
    private let cprVibration = cprVibrationTimer()
    
    
//   MARK: GLOBAL VARIABLE + UI Buttons
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    @IBOutlet weak var newReset: UIButton!
    
    
    //MARK: UI Code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        globalEpiTimer.setLabelVC(epiLabel, epiCountGlobal, self)
        
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
        accessButton.configureCheck()
        epiButton.configureCheckEpi()
        epiLabel.configureEpiListLabel()
        intubationButton.configureCheck()
        cprCountGlobal.text = "CPR:\(globalCounter.cprCountGlobal)"
        shockCountGlobal.text = "Defib:\(globalCounter.defibCountGlobal)"
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse6")
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.continueGlobalTime()
        globalEpiTimer.setLabelVC(epiLabel, epiCountGlobal, self)
        globalEpiTimer.continueEpiTimer()
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse6")
        globalCprTimer.continueCpr()
        stopButton.setStopText()
        cprButton.configureCheckCpr()
        
     
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        
        accessButton.configureCheck()
        epiButton.configureCheckEpi()
        intubationButton.configureCheck()
        
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)

        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        intLabel.reset()
        accessLabel.reset()
        intLabel.reset()
        cprListLabel.reset()
    }
    
    
    @IBAction func stopTapped(_ sender: Any) {
        
        stopButton.stopButtonProp(cprVibration: cprVibration, cprButton: cprButton, cprListLabel: cprListLabel, VC:self)
        
    }
    
    

    @IBAction func resetPress(_ sender: Any) {

        newReset.resetCPRonly(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel, cprButton: cprButton, cprCountGlobal: cprCountGlobal)}
    
    
    @IBAction func totalResetPress(_ sender: Any) {
    
        totalReset.totalReset(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel)
        
        //        Reset everthing
                cprCountGlobal.text = "CPR: 0"
                epiCountGlobal.text = "Epi: 0"
                shockCountGlobal.text = "Defib: 0"
                timeCountGlobal.text = "00:00"
                
                cprButton.configureCheck()
                accessButton.configureCheck()
                epiButton.configureCheck()
                intubationButton.configureCheck()
                intLabel.reset()
                cprListLabel.reset()
                epiLabel.text = "Epinephrine 1mg"
                epiLabel.reset()
                accessLabel.reset()
    
    }
  
          
            
    
    
    
    
    
    
    
    
    @IBAction func homeTapped(_ sender: Any) {
        totalReset.totalReset(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel)
        
        //        Reset everthing
                cprCountGlobal.text = "CPR: 0"
                epiCountGlobal.text = "Epi: 0"
                shockCountGlobal.text = "Defib: 0"
                timeCountGlobal.text = "00:00"
                
                cprButton.configureCheck()
                accessButton.configureCheck()
                epiButton.configureCheck()
                intubationButton.configureCheck()
                intLabel.reset()
                cprListLabel.reset()
                epiLabel.text = "Epinephrine 1mg"
                epiLabel.reset()
                accessLabel.reset()
        
        htTable.resetTable()
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    // MARK: Bottom button actions
    
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
    
    
    @IBAction func structurePressed(_ sender: Any) {
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
    
    
    
    
    
//    MARK: Checklist buttons 
    
    @IBAction func cprPress(_ sender: Any) {
        cprButton.checkOffOn()
        cprListLabel.fadeLabel()
        cprButton.cprButtonProperties(cprLabel: cprLabel, cprVibration: cprVibration, cprCountGlobal: cprCountGlobal, cprListLabel: cprListLabel, VC:self)
        stopButton.setStopText()
    }
    
   
    
    @IBAction func accessPress(_ sender: Any) {
        accessButton.checkOffOn()
        accessLabel.fadeLabel()
        
        if accessButton.isSelected == true{
            let time = eventLog.getDate()
            eventLog.eventTime.append("Sent Labs and confirmed IV access: \(time)")
        }
    }
    
    
    
    @IBAction func epiPressed(_ sender: Any) {
        epiButton.checkOffOn()
        epiLabel.fadeLabel()
        epiButton.epiButtonProperties(epiLabel: epiLabel, epiCountLabel: epiCountGlobal)
        }
    
    
    @IBAction func intPressed(_ sender: Any) {
        intubationButton.checkOffOn()
        intLabel.fadeLabel()
    }
    
    


}
