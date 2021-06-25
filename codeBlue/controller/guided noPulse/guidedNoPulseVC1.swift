//
//  guidedNoPulseVC1.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit
import AudioToolbox


class guidedNoPulseVC1: UIViewController {

//  MARK: CHECKLIST variables
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var o2Button: UIButton!
    @IBOutlet var defibButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet weak var assignButton: UIButton!
    
    @IBOutlet weak var newReset: UIButton!
    
    @IBOutlet weak var totalReset: UIBarButtonItem!
    
    
// MARK: label outlets
    @IBOutlet weak var o2Label: UILabel!
    @IBOutlet weak var cprListLabel: UILabel!
    @IBOutlet weak var assignLabel: UILabel!
    @IBOutlet weak var defibLabel: UILabel!
    
    
    
    private let cprVibration = cprVibrationTimer()
   
//  MARK: GLOBAL VARIABLE Labels/Button
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!

    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    
    @IBOutlet weak var logButton: UIButton!
    
    
//    MARK: Bottom popup buttons
    @IBOutlet weak var roscButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var rolesButton: UIButton!
    @IBOutlet weak var causesButton: UIButton!
    
    
// MARK: UI Code 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        roscButton.configure(title:"ROSC")
        algoButton.configure(title: "Algo")
        rolesButton.configure(title: "Roles")
        causesButton.configure(title: "H&T")
        cprButton.configureCheckCpr()
        o2Button.configureCheck()
        defibButton.configureCheck()
        
        stopButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        
        stopButton.setStopText()
        
        newReset.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -4)
        
        
        assignButton.configureCheck()
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        cprListLabel.configureCprListLabel()
        
        
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse1")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.continueGlobalTime()
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse1")
        globalCprTimer.continueCpr()
        
        epiCountGlobal.text="Epi: \(globalCounter.epiCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        htTable.resetTable()
        stopButton.setStopText()
        cprButton.configureCheckCpr()
        
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        
        stopButton.stopButtonProp(cprVibration: cprVibration, cprButton: cprButton, cprListLabel: cprListLabel, VC:self)
    }
    
    
    
    @IBAction func resetPress(_ sender: Any) {
        newReset.resetCPRonly(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel, cprButton: cprButton, cprCountGlobal: cprCountGlobal)
    }
        
    
    
    @IBAction func totalResetPress(_ sender: Any) {
   // EXTENSION ON BARBUTTON ITEM
       
        totalReset.totalReset(stopButton: stopButton, cprVibration: cprVibration, cprLabel: cprLabel, cprListLabel: cprListLabel)
        
        //        Reset everthing
                    cprCountGlobal.text = "CPR: 0"
                    epiCountGlobal.text = "Epi: 0"
                    shockCountGlobal.text = "Defib: 0"
                    timeCountGlobal.text = "00:00"
                    
                    
                    cprButton.configureCheckCpr()
                    o2Button.configureCheck()
                    defibButton.configureCheck()
                    assignButton.configureCheck()
                    assignLabel.reset()
                    cprListLabel.reset()
                    o2Label.reset()
                    defibLabel.reset()
    }
    

        
    
    
    
    
    

    
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalTimer?.invalidate()
        globalCprTimer.timer?.invalidate()
        globalCounter.globalTimeCounter = 0
        timeCountGlobal.text = "00:00"
        globalCounter.globalReset()  
        cprVibration.time=0
        cprVibration.timer?.invalidate()
        htTable.resetTable()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
// MARK: Bottom button actions
    
    @IBAction func rolesPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "codeStructure")
        self.present(vc, animated: true)
    }
    
    
    @IBAction func roscPress(_ sender: Any) {
        globalCounter.globalTimer?.invalidate()
        
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
        let vc = storyboard.instantiateViewController(withIdentifier: "cardiacAlgo1")
        self.present(vc, animated: true)
    
        }
    
    
    @IBAction func causesPressed(_ sender: Any) {
    
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "htCauses")
        self.present(vc, animated: true)
    
    }
    
    
    @IBAction func logPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "eventLog")
        self.present(vc, animated: true)
        
    }
    
    
//    MARK: Checklist Actions
    
    @IBAction func assignPress(_ sender: Any) {
        assignLabel.fadeLabel()
        assignButton.checkOffOn()
    }
    
    @IBAction func cprPress(_ sender: Any) {
        
        cprButton.checkOffOn()
        cprListLabel.fadeLabel()

        cprButton.cprButtonProperties(cprLabel: cprLabel, cprVibration: cprVibration, cprCountGlobal: cprCountGlobal, cprListLabel: cprListLabel, VC:self)
        
        stopButton.setStopText()
        
    }
    
    @IBAction func o2Press(_ sender: Any) {
        o2Button.checkOffOn()
        o2Label.fadeLabel()
        
        bagMaskAlerts.alert1(VC: self)
    
    
        let when2 = DispatchTime.now() + 60
               DispatchQueue.main.asyncAfter(deadline: when2){
                bagMaskAlerts.alert2(VC: self)
               }}
        
    
       
    
    @IBAction func defibPress(_ sender: Any) {
        defibButton.checkOffOn()
        defibLabel.fadeLabel()
    }
    
    
  
    
    
}
    
    
    
    

    
   
   

    
    

    

