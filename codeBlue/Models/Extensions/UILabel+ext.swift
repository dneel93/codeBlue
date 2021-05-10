//
//  UILabel+ext.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/27/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

extension UILabel {
    
    
    
    func configureLabel() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
    
    func fadeLabel(){
        
        if self.textColor == UIColor.black.withAlphaComponent(1.0) {
        
            self.textColor = UIColor.black
                .withAlphaComponent(0.3)}
        
        else if self.textColor == UIColor.black.withAlphaComponent(0.3)
        
            { self.textColor = UIColor.black
            .withAlphaComponent(1.0)}
            
    }
    
    func reset(){
        self.textColor = UIColor.black
        .withAlphaComponent(1.0)
    }
    
    
}
