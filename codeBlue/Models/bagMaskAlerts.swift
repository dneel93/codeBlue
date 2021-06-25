//
//  bagMaskAlerts.swift
//  codeBlue
//
//  Created by Dylan Neel on 6/24/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

class bagMaskAlerts {
    
    
    static func alert2(VC:UIViewController){
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 21)!, NSAttributedString.Key.foregroundColor: UIColor.black]
          let titleString = NSAttributedString(string: "Check ETCO2", attributes: titleAttributes)
        let messageAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 17)!, NSAttributedString.Key.foregroundColor: UIColor.black]
          let messageString = NSAttributedString(string: "\nGoal: ETCO2 15-20 mmHg\n\nETCO2 <10mmHg may indicate inadequate compressions\n\nSudden rise suggests ROSC", attributes: messageAttributes)
        
        
        let bagMaskAlert2 = UIAlertController(title:"", message:"", preferredStyle: .alert)
        
        bagMaskAlert2.setValue(titleString, forKey: "attributedTitle")
        bagMaskAlert2.setValue(messageString, forKey: "attributedMessage")
        
        bagMaskAlert2.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action) in}
    
       ))
        
        VC.present(bagMaskAlert2, animated: true, completion: nil)
       }
    
    static func alert1(VC:UIViewController){
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 21)!, NSAttributedString.Key.foregroundColor: UIColor.black]
          let titleString = NSAttributedString(string: "Bag Mask", attributes: titleAttributes)
        let messageAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 17)!, NSAttributedString.Key.foregroundColor: UIColor.black]
          let messageString = NSAttributedString(string: "\nAttach ETCO2 device\n\nHyperventilation WARNING\n\n  1) Give breaths every 6s\n\n    2) Squeeze bag slowly over 1s", attributes: messageAttributes)
        
        
        let bagMaskAlert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        bagMaskAlert.setValue(titleString, forKey: "attributedTitle")
        bagMaskAlert.setValue(messageString, forKey: "attributedMessage")
        
        bagMaskAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action) in}
    
       ))
        
        VC.present(bagMaskAlert, animated: true, completion: nil)
        
        
        let when = DispatchTime.now() + 4.5
               DispatchQueue.main.asyncAfter(deadline: when){
                   // your code with delay
                   bagMaskAlert.dismiss(animated: true, completion: nil)
                
                
                
               }
    }
    
    
    
    
    }



    
    
    
    

