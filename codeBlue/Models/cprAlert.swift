//
//  cprAlert.swift
//  codeBlue
//
//  Created by Dylan Neel on 2/13/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit


class cprAlert {
    

    static func sendAlert(VC:UIViewController) {
    let cprExcelAlert = UIAlertController(title: "", message: nil, preferredStyle: .alert)

    let image = UIImage(named: "cprAlertNew")
    let imageView = UIImageView(frame: CGRect(x: 72, y: 30, width: 350, height:414))
        
    imageView.image = image
    cprExcelAlert.view.addSubview(imageView)
    
    let height = NSLayoutConstraint(item: cprExcelAlert.view as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 500)
    
        let width = NSLayoutConstraint(item: cprExcelAlert.view as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 500)
    
    cprExcelAlert.view.addConstraint(height)
    cprExcelAlert.view.addConstraint(width)
    
    
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    cprExcelAlert.addAction(action)

    VC.present(cprExcelAlert, animated: true, completion: nil)

    
        let when = DispatchTime.now() + 5
           DispatchQueue.main.asyncAfter(deadline: when){
               // your code with delay
              cprExcelAlert.dismiss(animated: true, completion: nil)
           }
        
    }
   
}
