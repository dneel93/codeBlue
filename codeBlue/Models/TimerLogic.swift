//
//  TimerLogic.swift
//  codeBlue
//
//  Created by Dylan Neel on 1/6/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

class timerClass {
   
    var time:Int = 0
    var timer:Timer!
    var label: UILabel?
    var type:String
    var vc: UIViewController?
 
    
    init(type:String){
        self.type = type
    }
    
    func alert(on vc: UIViewController){
        
        let alert = UIAlertController(title: "Time Alert", message: "2 min since \(type) started", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
        
        
        let when = DispatchTime.now() + 3.5
               DispatchQueue.main.asyncAfter(deadline: when){
                   // your code with delay
                   alert.dismiss(animated: true, completion: nil)
               }

    
    }

    func setLabel(_ l:UILabel, _ v:UIViewController){
        
        self.label = l
        self.vc = v
    }
    
    
    
    
   func startTimer(){
        
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
        }
    
    
    func invalidate(){
        self.timer?.invalidate()
    }
    
    
    @objc func countup() {
        time+=1
        var minutes: Int
        var seconds: Int
        minutes = (time % 3600) / 60
        seconds = (time % 3600) % 60
        if let l = label{
            l.text=String(format: "\(type): %02d:%02d", minutes, seconds)
        }
        
        if time == 120 {
            self.timer?.invalidate()
            if let v = vc {
                alert(on: v)
            }

        }
        

        }
      
    }
