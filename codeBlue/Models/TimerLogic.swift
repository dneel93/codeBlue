//
//  TimerLogic.swift
//  codeBlue
//
//  Created by Dylan Neel on 1/6/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit


class timerLogic {
    
   
    var time:Int = 0
    var timer:Timer!
    var label: UILabel?
    var type:String
    
    init(type:String){
        self.type = type
    }

    func setLabel(_ l:UILabel){
        
        self.label = l
    }
    
    
   func startTimer(){
        
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
        }
    
    
    func invalidate(){
        self.timer.invalidate()
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
        
        
        }
      
    }
