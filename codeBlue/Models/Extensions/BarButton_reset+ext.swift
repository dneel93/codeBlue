//
//  BarButton_reset+ext.swift
//  codeBlue
//
//  Created by Dylan Neel on 6/19/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    func totalReset(stopButton:UIButton, cprVibration:cprVibrationTimer,cprLabel:UILabel,cprListLabel:UILabel){
    
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
    
}
