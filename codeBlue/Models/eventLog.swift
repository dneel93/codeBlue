//
//  eventLog.swift
//  codeBlue
//
//  Created by Dylan Neel on 8/24/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit


struct eventLog {
    
    
    static func getDate()->String{
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        let log = "\(hour):\(minutes)"
        
        return log
    }
    
    static var eventTime:[String] = []
    
    
    
}
