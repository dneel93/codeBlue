//
//  UIButton_cprEpi+ext.swift
//  codeBlue
//
//  Created by Dylan Neel on 6/16/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

extension UIButton {

    func configure(title:String, colors:UIColor? = nil){
        self.setTitle(title, for: .normal)
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.titleLabel?.textAlignment = .center
        
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.2
    
   
        if let color = colors {
            self.backgroundColor = color
        }
        
        else{
            let color1=UIColor(red: 106.0/255.0, green: 140.0/255.0, blue: 223.0/255.0, alpha: 1.0)
            
            let color2=UIColor(red: 107.0/255.0, green: 173.0/255.0, blue: 237.0/255.0, alpha: 1.0)
            
            self.applyGradient(colours: [color1, color2])
        }
        
 
        
    
    
    self.layer.cornerRadius = 10
        
}
    
    func configureShadow(){
        layer.cornerRadius = 8
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.2
    }
    
    
    func epiButtonProperties(epiLabel:UILabel, epiCountLabel:UILabel){
        
        
        if globalEpiTimer.timer?.isValid ?? false {
            globalEpiTimer.timer?.invalidate()
            globalEpiTimer.timeCounter = 180
            epiLabel.text = "Epinephrine 1mg"
        }
        
        else if globalEpiTimer.timer?.isValid == false && globalEpiTimer.timeCounter < 180 {
            globalEpiTimer.timeCounter = 180
            epiLabel.text = "Epinephrine 1mg"
        }
        
        
        
        else{
            globalEpiTimer.timeCounter = 180
            globalEpiTimer.startGlobalTime()
            globalCounter.epiCountGlobal+=1
            let time = eventLog.getDate()
            eventLog.eventTime.append("Epi dose: \(time)")
            epiCountLabel.text = "Epi: \(globalCounter.epiCountGlobal)"}
        
    }
    
    
    
    func cprButtonProperties(cprLabel:UILabel, cprVibration:cprVibrationTimer, cprCountGlobal:UILabel, cprListLabel:UILabel, VC:UIViewController){
        
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
            cprAlert.sendAlert(VC: VC)
            globalCounter.cprCountGlobal+=1
            let time = eventLog.getDate()
            eventLog.eventTime.append("CPR Round: \(time)")
            cprVibration.time = 0
            cprVibration.startVibration()
        }
        
        
    }
    
    
    func stopButtonProp(cprVibration:cprVibrationTimer, cprButton:UIButton?,cprListLabel:UILabel?, VC:UIViewController){
        
        
        if globalCprTimer.timer?.isValid == true{
            globalCprTimer.invalidate()
            cprVibration.timer?.invalidate()
            cprVibration.time = 0
            setBackgroundImage( UIImage(named: "Resume"), for: .normal)
            
        }
            
        
        else if globalCprTimer.timer?.isValid == false && globalCprTimer.time < 120 {
            globalCprTimer.startCpr()
    //  Configure button
            setBackgroundImage( UIImage(named: "Stop"), for: .normal)
            
            
        }
        
        else {
            globalCprTimer.startCpr()
            globalCounter.cprCountGlobal+=1
            let time = eventLog.getDate()
            eventLog.eventTime.append("CPR Round: \(time)")
            cprAlert.sendAlert(VC: VC)
//                Configure button
            setBackgroundImage( UIImage(named: "Stop"), for: .normal)
            
            if let c = cprButton, let cl = cprListLabel{
                    c.configureCheckCpr()
                    cl.fadeLabel()
                    }
            cprVibration.time = 0
            cprVibration.startVibration()
        
        }
        
    }
    
    
    func resetButtonProp(stopButton:UIButton, cprVibration:cprVibrationTimer,cprLabel:UILabel,cprListLabel:UILabel){
    
        //        change stop button color

                    stopButton.setBackgroundImage( UIImage(named: "Start"), for: .normal)
                    
        //        stop timers
                    globalCounter.globalTimer?.invalidate()
                    globalCounter.startGlobalTime()
                
                    globalCprTimer.timer?.invalidate()
        
                    globalEpiTimer.timer?.invalidate()
                    cprVibration.timer?.invalidate()
                    
                    cprLabel.text = "2:00"
                    cprListLabel.reset()
                    
                    htTable.resetTable()
        
                    globalCounter.globalReset()
                    globalCprTimer.time = 120
                    globalEpiTimer.timeCounter = 180
            }
    
    
    func resetCPRonly(stopButton:UIButton, cprVibration:cprVibrationTimer,cprLabel:UILabel,cprListLabel:UILabel, cprButton:UIButton, cprCountGlobal:UILabel){
        
        
        stopButton.setBackgroundImage( UIImage(named: "Start"), for: .normal)
        
        
        globalCprTimer.timer?.invalidate()
        globalCprTimer.time = 120
        cprLabel.text = "2:00"
        cprListLabel.reset()
        cprVibration.timer?.invalidate()
        cprButton.configureCheckCpr()
        cprCountGlobal.text = "CPR: \(globalCounter.cprCountGlobal)"
        
    }
    
    
    
    
    func setStopText(){
        
        if globalCprTimer.timer?.isValid == true{
            
            setBackgroundImage( UIImage(named: "Stop"), for: .normal)
            layer.shadowRadius = 4
            layer.shadowOpacity = 0.5
        }
        
        else if globalCprTimer.timer?.isValid == false && globalCprTimer.time < 120 {
            
            setBackgroundImage( UIImage(named: "Resume"), for: .normal)
            layer.shadowRadius = 4
            layer.shadowOpacity = 0.5
        }
        
        else{setBackgroundImage( UIImage(named: "Start"), for: .normal)
            layer.shadowRadius = 4
            layer.shadowOpacity = 0.5
        }
    }
    
    
    
        
    }
        

            
    
        
    
    
    
    
    

