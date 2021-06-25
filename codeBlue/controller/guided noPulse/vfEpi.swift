//
//  vfEpi.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/3/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class vfEpi: UIViewController {
    
//    MARK: Variables
    
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var epiButton: UIButton!
    @IBOutlet var intButton: UIButton!
    @IBOutlet var epiLabel: UILabel!
    
    @IBOutlet weak var roscButton: UIButton!
    @IBOutlet weak var algoButton: UIButton!
    @IBOutlet weak var rolesButton: UIButton!
    
    @IBOutlet weak var htButton: UIButton!
    @IBOutlet weak var totalReset: UIBarButtonItem!
    
    
// MARK: Labels
    
    @IBOutlet weak var cprListLabel: UILabel!
    @IBOutlet weak var intLabel: UILabel!
    
    private let cprVibration = cprVibrationTimer()
    
//    MARK: GLOBAL VARIABLES
    
    @IBOutlet var cprCountGlobal: UILabel!
    @IBOutlet var shockCountGlobal: UILabel!
    @IBOutlet var epiCountGlobal: UILabel!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var timeCountGlobal: UILabel!
    @IBOutlet weak var newReset: UIButton!
    
   
//    MARK:  Code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        globalEpiTimer.setLabelVC(epiLabel, epiCountGlobal, self)
        
        stopButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        newReset.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -4)
        
        algoButton.layer.cornerRadius = 8
        roscButton.layer.cornerRadius = 8
        rolesButton.layer.cornerRadius = 8
        htButton.layer.cornerRadius = 8
        cprButton.configureCheckCpr()
        cprListLabel.configureCprListLabel()
        epiButton.configureCheckEpi()
        epiLabel.configureEpiListLabel()
        intButton.configureCheck()

        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprCountGlobal.configureLabel()
        shockCountGlobal.configureLabel()
        epiCountGlobal.configureLabel()
        
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse5")
        stopButton.setStopText()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.continueGlobalTime()
        globalEpiTimer.setLabelVC(epiLabel, epiCountGlobal, self)
        globalEpiTimer.continueEpiTimer()
        globalCprTimer.setCprLabel(cprLabel, cprCountGlobal, self, "noPulse5")
        globalCprTimer.continueCpr()
        
        cprCountGlobal.text = "CPR:  \(globalCounter.cprCountGlobal)"
        shockCountGlobal.text = "Defib: \(globalCounter.defibCountGlobal)"
        cprButton.configureCheckCpr()
        epiButton.configureCheckEpi()
        intButton.configureCheck()
        stopButton.setStopText()
        
        epiLabel.text = "Epinephrine 1mg"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)

        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        cprListLabel.reset()
        intLabel.reset()
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
                    cprButton.configureCheck()
                    intButton.configureCheck()
                    epiButton.configureCheck()
                    intLabel.reset()
                    cprListLabel.reset()
                    epiLabel.text = "Epinephrine 1mg"
                    epiLabel.reset()
    }
    
    
    

          
    
    
    

    
    

    
//    UI Buttons
        
        
    @IBAction func homeTapped(_ sender: Any) {
        globalCounter.globalReset()  
        globalCounter.globalTimer.invalidate()
        cprVibration.timer?.invalidate()
        cprVibration.time = 0
        
        cprCountGlobal.text = "CPR: 0"
        epiCountGlobal.text = "Epi: 0"
        shockCountGlobal.text = "Defib: 0"
        timeCountGlobal.text = "00:00"
        htTable.resetTable()
        
        self.navigationController?.popToRootViewController(animated: true)
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
        let vc = storyboard.instantiateViewController(withIdentifier: "cardiacAlgo")
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
    
    
    
    
//    MARK: Checklist
    
    @IBAction func cprPressed(_ sender: Any) {
        
        cprButton.checkOffOn()
        cprListLabel.fadeLabel()
        cprButton.cprButtonProperties(cprLabel: cprLabel, cprVibration: cprVibration, cprCountGlobal: cprCountGlobal, cprListLabel: cprListLabel, VC:self)
        stopButton.setStopText()
    }
    
    
    @IBAction func epiPressed(_ sender: Any) {
        epiButton.checkOffOn()
        epiButton.epiButtonProperties(epiLabel: epiLabel, epiCountLabel: epiCountGlobal)
    }
    
    
    
    
    @IBAction func intPressed(_ sender: Any) {
        intButton.checkOffOn()
        intLabel.fadeLabel()
    }
    
    
    
    

}
