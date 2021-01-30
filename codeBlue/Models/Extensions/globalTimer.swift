//
//  globalTimer.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/5/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class globalCounter{
    
    static var cprCountGlobal:Int = 0
    static var epiCountGlobal:Int = 0
    static var defibCountGlobal:Int = 0
    static var amioCountGlobal:Int = 0
    static var globalTimer:Timer!
    static var globalTimeCounter = 0
    
    static var label: UILabel?
    static var vc: UIViewController?
    
    
    static func setLabelVC(_ l:UILabel, _ v:UIViewController){
        
        self.label = l
        self.vc = v
    }
    
    
    static func startGlobalTime(){
        globalCounter.globalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUITime), userInfo: nil, repeats: true)
    }
    
    
    static func alert(on vc: UIViewController){
        
        let alert = UIAlertController(title: "Time Alert", message: "10 min since code started", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
        
        
        let when = DispatchTime.now() + 3
               DispatchQueue.main.asyncAfter(deadline: when){
                   // your code with delay
                   alert.dismiss(animated: true, completion: nil)
               }
    }
    
    
    @objc static func updateUITime() {
        globalCounter.globalTimeCounter += 1
        var minutes: Int
        var seconds: Int
        minutes = (globalCounter.globalTimeCounter % 3600) / 60
        seconds = (globalCounter.globalTimeCounter % 3600) % 60
        
        if let l = globalCounter.label{
            l.text=String(format: "Total Time: %02d:%02d", minutes, seconds)
        }
        
        if globalCounter.globalTimeCounter == 600 {
            if let v = globalCounter.vc {
                globalCounter.alert(on: v)
            }

        }
    
}
    
    
    


    
}


