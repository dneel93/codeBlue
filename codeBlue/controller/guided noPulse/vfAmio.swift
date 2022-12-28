//
//  vfAmio.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/3/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class vfAmio: UIViewController {

    
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var amioButton: UIButton!
    @IBOutlet var causesButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet weak var epiButton: UIButton!
    
    @IBOutlet weak var epiLabel: UILabel!
    
    @IBOutlet weak var logButton: UIButton!
    @IBOutlet weak var totalReset: UIBarButtonItem!
    
    // MARK: labels

    @IBOutlet weak var cprListLabel: UILabel!
    @IBOutlet weak var amioLabel: UILabel!
    @IBOutlet weak var causesLabel: UILabel!
    
    
//    MARK: bottom buttons
    @IBOutlet weak var rolesButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var roscButton: UIButton!
    
    @IBOutlet weak var htButton: UIButton!
    
    
    
//    MARK: Timers
    private let cprVibration = cprVibrationTimer()
    
//   MARK: Global Variables
    
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    @IBOutlet weak var newReset: UIButton!
    
    
//  MARK: Code
    
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
        
        
        amioButton.configureCheck()
        cprButton.configureCheckCpr()
        cprListLabel.configureCprListLabel()
        causesButton.configureCheck()
        epiButton.configureCheckEpi()
        epiLabel.configureEpiListLabel()
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse9")
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.continueGlobalTime()
        globalEpiTimer.setLabelVC(epiLabel, epiCountGlobal, self)
        globalEpiTimer.continueEpiTimer()
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse9")
        globalCprTimer.continueCpr()
        stopButton.setStopText()
        
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        
        amioButton.configureCheck()
        cprButton.configureCheckCpr()
        causesButton.configureCheck()
        epiButton.configureCheckEpi()
        epiLabel.configureEpiListLabel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        cprListLabel.reset()
        amioLabel.reset()
        causesLabel.reset()
    }


    // UI buttons
    
    @IBAction func stopTapped(_ sender: Any) {
       
        stopButton.stopButtonProp(cprVibration: cprVibration, cprButton: cprButton, cprListLabel: cprListLabel, VC:self)
    }
    
    

        

            
    
    @IBAction func resetPress(_ sender: Any) {

        newReset.resetCPRonly(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel, cprButton:cprButton,cprCountGlobal: cprCountGlobal)}
    
    
    @IBAction func totalResetPress(_ sender: Any) {
    
            totalReset.totalReset(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel)
        
        //        Reset everthing
                    cprCountGlobal.text = "CPR: 0"
                    epiCountGlobal.text = "Epi: 0"
                    shockCountGlobal.text = "Defib: 0"
                    timeCountGlobal.text = "00:00"
                    
                    cprButton.configureCheckCpr()
                    cprButton.configureCheck()
                    amioButton.configureCheck()
                    causesButton.configureCheck()
                    epiButton.configureCheck()
                    cprListLabel.reset()
                    causesLabel.reset()
                    amioLabel.reset()
                    epiLabel.text = "Epinephrine 1mg"
    }
    
    
        

          
    
    
    
    
    
    
    
    
    
    @IBAction func homeTapped(_ sender: Any) {
        totalReset.totalReset(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel)
    
    //        Reset everthing in UI
                cprCountGlobal.text = "CPR: 0"
                epiCountGlobal.text = "Epi: 0"
                shockCountGlobal.text = "Defib: 0"
                timeCountGlobal.text = "00:00"
                
                cprButton.configureCheckCpr()
                cprButton.configureCheck()
                amioButton.configureCheck()
                causesButton.configureCheck()
                epiButton.configureCheck()
                cprListLabel.reset()
                causesLabel.reset()
                amioLabel.reset()
                epiLabel.text = "Epinephrine 1mg"
                htTable.resetTable()
        
       
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
//    MARK: Top button functions
    
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
        let vc = storyboard.instantiateViewController(withIdentifier: "cardiacAlgo")
        self.present(vc, animated: true)
    }
    
    
    @IBAction func htPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "htCauses")
        self.present(vc, animated: true)
      
    }
    
    
//    MARK: Checklist
    
    
    
    @IBAction func cprPressed(_ sender: Any) {

        cprButton.checkOffOn()
        cprListLabel.fadeLabel()
        cprButton.cprButtonProperties(cprLabel: cprLabel, cprVibration: cprVibration, cprCountGlobal: cprCountGlobal, cprListLabel: cprListLabel, VC:self)
        stopButton.setStopText()
    }
    
    
    
    
    
    @IBAction func amioPressed(_ sender: Any) {
        amioButton.checkOffOn()
        amioLabel.fadeLabel()
        
        if amioButton.isSelected == true{
            globalCounter.amioCountGlobal+=1
            let time = eventLog.getDate()
            eventLog.eventTime.append("Amio Dose: \(time)")
        }
        
    }
    
    
    
    @IBAction func epiPressed(_ sender: Any) {
        epiButton.checkOffOn()
        epiLabel.fadeLabel()
        epiButton.epiButtonProperties(epiLabel: epiLabel, epiCountLabel: epiCountGlobal)
        
    }
    
    
    
    
    @IBAction func causesPressed(_ sender: Any) {
        causesButton.checkOffOn()
        causesLabel.fadeLabel()
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
