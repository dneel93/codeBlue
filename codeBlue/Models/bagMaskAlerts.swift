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
        
        let bagMaskAlert2 = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        
        let image = UIImage(named: "bagMaskAlert2")
        let imageView = UIImageView(frame: CGRect(x: 85, y: 20, width: 280, height:350))
        imageView.image = image
        bagMaskAlert2.view.addSubview(imageView)
        
        let height = NSLayoutConstraint(item: bagMaskAlert2.view as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 420)
        
            let width = NSLayoutConstraint(item: bagMaskAlert2.view as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 450)
        
        bagMaskAlert2.view.addConstraint(height)
        bagMaskAlert2.view.addConstraint(width)
        
        
        bagMaskAlert2.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action) in}
    
       ))
        
        VC.present(bagMaskAlert2, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 5.5
               DispatchQueue.main.asyncAfter(deadline: when){
                   // your code with delay
                   bagMaskAlert2.dismiss(animated: true, completion: nil)
               }}
    
    
    
    static func alert1(VC:UIViewController){
        
        
        let bagMaskAlert = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        
        let image = UIImage(named: "bagMask3")
        let imageView = UIImageView(frame: CGRect(x: 85, y: 20, width: 280, height:350))
        imageView.image = image
        bagMaskAlert.view.addSubview(imageView)
        
        let height = NSLayoutConstraint(item: bagMaskAlert.view as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 420)
        
            let width = NSLayoutConstraint(item: bagMaskAlert.view as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 450)
        
        bagMaskAlert.view.addConstraint(height)
        bagMaskAlert.view.addConstraint(width)
        
        
        bagMaskAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action) in}
    
       ))
        
        VC.present(bagMaskAlert, animated: true, completion: nil)
        
        
        let when = DispatchTime.now() + 6.5
               DispatchQueue.main.asyncAfter(deadline: when){
                   // your code with delay
                   bagMaskAlert.dismiss(animated: true, completion: nil)
                
                
                
               }
    }
    
    
    
    
    }



    
    
    
    

