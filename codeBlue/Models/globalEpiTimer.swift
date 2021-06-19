//
//  globalEpiTimer.swift
//  codeBlue
//
//  Created by Dylan Neel on 6/15/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

class globalEpiTimer{
    

    static var timer:Timer!
    static var timeCounter = 180
    
    static var label: UILabel?
    static var label2:UILabel?
    static var vc: UIViewController?
    
    
    static func setLabelVC(_ l1:UILabel?,_ l2:UILabel, _ v:UIViewController){
        self.label = l1
        self.label2 = l2
        self.vc = v
    }
    
    static func setLabelVC1(_ l2:UILabel, _ v:UIViewController){
        
        self.label2 = l2
        self.vc = v
    }
    

    
    
    static func startGlobalTime(){
        globalEpiTimer.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUITime), userInfo: nil, repeats: true)
    }
    
    static func continueEpiTimer(){
        
        if globalEpiTimer.timer?.isValid == true{
            globalEpiTimer.timer?.invalidate()
            globalEpiTimer.startGlobalTime()}
    }
    
    static func invalidate(){
        self.timer?.invalidate()
    }
    
    static func alert(on vc: UIViewController){
        
        let alert = UIAlertController(title: "Time Alert", message: "Give another Epi dose in 3 min", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 3
               DispatchQueue.main.asyncAfter(deadline: when){
                   // your code with delay
                   alert.dismiss(animated: true, completion: nil)
               }
    }
    
    
    @objc static func updateUITime() {
        globalEpiTimer.timeCounter -= 1
        var minutes: Int
        var seconds: Int
        minutes = (globalEpiTimer.timeCounter % 3600) / 60
        seconds = (globalEpiTimer.timeCounter % 3600) % 60
        
        if let l = globalEpiTimer.label, let l2 = globalEpiTimer.label2{
            
            let time = String(format: "%01d:%02d", minutes, seconds)
            l.text = "Epi: \(time)"
            l2.text="Epi: \(globalCounter.epiCountGlobal)\n\(time)"
        }
    
        if globalEpiTimer.timeCounter == 0 {
            if let v = globalEpiTimer.vc {
                globalEpiTimer.alert(on: v)
                self.timer.invalidate()
            }
        }
}
    
    
   static func globalReset(){
    self.timeCounter = 0
    }
    
    
    


    
}
