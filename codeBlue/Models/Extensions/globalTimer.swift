//
//  globalTimer.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/5/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit
class TimerManager {

var realSharedInstance: TimerManager?
var sharedInstance: TimerManager {
    get{
        if let realSharedInstance = realSharedInstance {
            return realSharedInstance
        }
        else{
            realSharedInstance = TimerManager()
            return realSharedInstance!
        }
    }
}

var timer: Timer

init() {
    timer = Timer()
}

func rest() {
    timer = Timer()
}
    
}
