//
//  UILabel_fade+ext.swift
//  codeBlue
//
//  Created by Dylan Neel on 6/16/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    
    
    func configureLabel() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
    func configureCprListLabel() {
        if globalCprTimer.timer?.isValid == true{
        self.textColor = UIColor.black
                .withAlphaComponent(0.3)
        } else{self.textColor = UIColor.black
            .withAlphaComponent(1.0)}
    }
    
    func configureEpiListLabel() {
        if globalEpiTimer.timer?.isValid == true{
        self.textColor = UIColor.black
                .withAlphaComponent(0.3)
        }
        
        else{self.textColor = UIColor.black
            .withAlphaComponent(1.0)}
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

