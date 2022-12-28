//
//  cprVibrationTimer.swift
//  codeBlue
//
//  Created by Dylan Neel on 2/14/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import Foundation
import AudioToolbox

class cprVibrationTimer {
    
    
    var timer:Timer!
    var time:Double = 0
    
    func startVibration(){
         
        timer = Timer.scheduledTimer(timeInterval:0.59 , target: self, selector: #selector(vibrate), userInfo: nil, repeats: true)
         }
    
    
    @objc func vibrate() {
        time+=0.59
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    
        if time > 10 {
            self.timer?.invalidate()
            time=0
        }
    
}

}
