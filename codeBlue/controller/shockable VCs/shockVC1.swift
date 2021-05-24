//
//  shockVC1.swift
//  codeBlue
//
//  Created by Dylan Neel on 4/21/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit
import AudioToolbox

class shockVC1: UIViewController {

    
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var shockButton: UIButton!
    
    @IBOutlet weak var timeCountGlobal: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    
    @IBOutlet weak var resumeButton: UIButton!
    
    
    
    // MARK:- View did load methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shockButton.setImage(UIImage(named:"white"), for: .normal)
        shockButton.isEnabled = false
        yesButton.layer.cornerRadius = 8
        noButton.layer.cornerRadius = 8

        
        // MARK:- global
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        resumeButton.isEnabled = false
        resumeButton.setBackgroundImage(UIImage(named:"white"), for: .disabled)
        resumeButton.setBackgroundImage(UIImage(named:"playButton"), for: .normal)
        shockButton.imageView!.contentMode = UIView.ContentMode.scaleAspectFit
        
    
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        globalCounter.setLabelVC(timeCountGlobal, self)
        globalCounter.globalTimer?.invalidate()
        globalCounter.startGlobalTime()
        
        
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
        resumeButton.isEnabled = false
        shockButton.setImage(UIImage(named:"white"), for: .normal)
        shockButton.isEnabled = false
        
    }
    
    
    
    
// MARK:- Buttons
    
    
    @IBAction func noPressed(_ sender: Any) {
      //storyboard segue
    }
    
    @IBAction func yesPressed(_ sender: Any) {
        
        if shockButton.isEnabled == false{
            shockButton.setImage(UIImage(named:"Defib2"), for: .normal)
            shockButton.isEnabled = true
        }
        
        else{
            shockButton.setImage(UIImage(named:"white"), for: .normal)
            shockButton.isEnabled = false
            
        }}
    
    
    @IBAction func shockPressed(_ sender: Any) {
        globalCounter.defibCountGlobal+=1
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
    }
    
    
    @IBAction func resetPressed(_ sender: Any) {
        
        if globalCounter.globalTimer?.isValid ?? false{
        
            globalCounter.globalTimer?.invalidate()
            resumeButton.isEnabled = true
            resetButton.setTitle("Reset", for: .normal)
            resetButton.setTitleColor(.systemBlue, for: .normal)
        }
        
        else if globalCounter.globalTimer?.isValid == false && globalCounter.globalTimeCounter > 0 {
            
            resetButton.setTitle("Start", for: .normal)
            resetButton.setTitleColor(.systemGreen, for: .normal)
            
            timeCountGlobal.text = "00:00"
            resumeButton.isEnabled = false
            globalCounter.globalReset()        }
    
            else {globalCounter.startGlobalTime()
                resetButton.setTitle("Stop", for: .normal)
                resetButton.setTitleColor(.systemRed, for: .normal)
                resumeButton.isEnabled = false
            }
    }
    
    
    @IBAction func resumePressed(_ sender: Any) {
        resumeButton.isEnabled = false
        
        globalCounter.startGlobalTime()
        resetButton.setTitle("Stop", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
    }
    

    

}
