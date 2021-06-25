//
//  globalCprTimer.swift
//  codeBlue
//
//  Created by Dylan Neel on 6/18/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit
import AudioToolbox


class globalCprTimer {

    static var time:Int = 120
    static var timer:Timer!
    static var label: UILabel?
    static var label2:UILabel?
    static var vc: UIViewController?
    static var segue: String?
 
    
    
   static func alert(on vc: UIViewController, to segue:String?){
        
        let alert = UIAlertController(title: "Time Alert", message: "2 min since CPR started", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Check Rhythm", style: UIAlertAction.Style.default, handler: {(action) in
            
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            if let s = segue{
            vc.performSegue(withIdentifier: s, sender: Any?.self)
            }
            
    
        }))
        
        vc.present(alert, animated: true, completion: nil)
        
    }
    
    
    static func pulseAlert(on vc: UIViewController){
        
        let alert = UIAlertController(title: "10s until pulse check", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action) in
            
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            }
        ))
        
        vc.present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 3.5
               DispatchQueue.main.asyncAfter(deadline: when){
                   // your code with delay
                   alert.dismiss(animated: true, completion: nil)
               }}

    
    static func setCprLabel(_ l1:UILabel?,_ l2:UILabel, _ v:UIViewController,_ s:String){
        
        self.label = l1
        self.label2 = l2
        self.vc = v
        self.segue = s
    }
    
    static func setLabelVC1(_ l2:UILabel, _ v:UIViewController){
        
        self.label2 = l2
        self.vc = v
        self.segue = nil
    }
    
    
   static func startCpr(){
        
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
        }
    
    static func invalidate(){
        self.timer?.invalidate()
    }
    
    @objc static func countup() {
        time-=1
        var minutes: Int
        var seconds: Int
        minutes = (time % 3600) / 60
        seconds = (time % 3600) % 60
        
        if let l = label, let l2=label2{
            
            let time = String(format: "%01d:%02d", minutes, seconds)
            l.text = time
            l2.text="CPR: \(globalCounter.cprCountGlobal)\n\(time)"
        }
        
        if time == 10 {
            if let v = vc{
                pulseAlert(on: v)}
        }
        
        else if time == 0 {
            self.timer?.invalidate()
            self.time = 120
            if let v = vc {
                alert(on: v, to: segue)
            }
            
            
        }
        
        }
    
    static func continueCpr(){
        
        if globalCprTimer.timer?.isValid == true {
            globalCprTimer.timer?.invalidate()
            globalCprTimer.startCpr()}
    }
}
