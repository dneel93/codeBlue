//
//  UIButton_cprEpi+ext.swift
//  codeBlue
//
//  Created by Dylan Neel on 6/16/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

extension UIButton {

func configure(title:String){
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 10
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.titleLabel?.textAlignment = .center}
    
    
    
    func epiButtonProperties(epiLabel:UILabel, epiCountLabel:UILabel){
        
        
        if globalEpiTimer.timer?.isValid ?? false {
            globalEpiTimer.timer?.invalidate()
            epiLabel.text = "Epinephrine 1mg"
        }
        
        else if globalEpiTimer.timer?.isValid == false && globalEpiTimer.timeCounter == 0 {
            globalEpiTimer.timeCounter = 180
            epiLabel.text = "Epinephrine 1mg"
        }
        
        else{
            globalEpiTimer.timeCounter = 180
            globalEpiTimer.startGlobalTime()
            globalCounter.epiCountGlobal+=1
            epiCountLabel.text = "Epi: \(globalCounter.epiCountGlobal)"}
        
    }
    
    
    
    func cprButtonProperties(cprLabel:UILabel, cprVibration:cprVibrationTimer, cprCountGlobal:UILabel){
        
        if globalCprTimer.timer?.isValid ?? false {
            globalCprTimer.timer?.invalidate()
            globalCprTimer.time = 120
            cprLabel.text = "2:00"
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
        }
        
        else if globalCprTimer.timer?.isValid == false && globalCprTimer.time < 120 {
            globalCprTimer.time = 120
            cprLabel.text = "2:00"
            cprVibration.time=0
            cprVibration.timer?.invalidate()
        }
        
        else{
            globalCprTimer.startCpr()
            globalCounter.cprCountGlobal+=1
            cprVibration.time = 0
            cprVibration.startVibration()
        }
        
        
    }
    
    
    func stopButtonProp(cprVibration:cprVibrationTimer, cprButton:UIButton?,cprListLabel:UILabel?){
        
        
        if globalCprTimer.timer?.isValid == true{
            globalCprTimer.invalidate()
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
            setTitle("Resume", for: .normal)
            setTitleColor(.systemIndigo, for: .normal)
        }
            
        
        else if globalCprTimer.timer?.isValid == false && globalCprTimer.time < 120 {
            globalCprTimer.startCpr()
    //  Configure button
            setTitle("Stop", for: .normal)
            setTitleColor(.systemRed, for: .normal)
        }
        
        else {
            globalCprTimer.startCpr()
            globalCounter.cprCountGlobal+=1
//                Configure button
        setTitle("Stop", for: .normal)
        setTitleColor(.systemRed, for: .normal)
            
            if let c = cprButton, let cl = cprListLabel{
                    c.checkOffOn()
                    cl.fadeLabel()
                    }
        }
        
    }
    
    
    func resetButtonProp(stopButton:UIButton, cprVibration:cprVibrationTimer,cprLabel:UILabel,cprListLabel:UILabel){
    
        //        change stop button color

                    stopButton.setTitle("Start", for: .normal)
                    stopButton.setTitleColor(.systemGreen, for: .normal)
                    
        //        stop timers
                    globalCounter.globalTimer?.invalidate()
                    globalCounter.startGlobalTime()
                
                    globalCprTimer.timer?.invalidate()
        
                    globalEpiTimer.timer?.invalidate()
                    cprVibration.timer?.invalidate()
                    
                    cprLabel.text = "2:00"
                    cprListLabel.reset()
                    
                    htTable.resetTable()
                
            }
    
    
    func setStopText(){
        
        if globalCprTimer.timer?.isValid == true{
            
            self.setTitle("Stop", for: .normal)
            self.setTitleColor(.systemRed, for: .normal)
        }
        
        else if globalCprTimer.timer?.isValid == false && globalCprTimer.time < 120 {self.setTitle("Resume", for: .normal)
            self.setTitleColor(.systemPurple, for: .normal)
        }
        
        else{self.setTitle("Start", for: .normal)
            self.setTitleColor(.systemGreen, for: .normal)
        }
    }
    
    
    
        
    }
        

            
    
        
    
    
    
    
    

