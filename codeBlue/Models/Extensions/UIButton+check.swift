//
//  UIButton_check+ext.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit


extension UIButton {

func configureCheckCpr(){
    
    if globalCprTimer.timer?.isValid == true{
        setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
        isSelected = true
    }
    
    else if globalCprTimer.timer?.isValid == false && globalCprTimer.time<120{
        
        setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
        isSelected = true
    }
    
    else {
        setBackgroundImage(UIImage(named: "empty_box"), for: .normal)
    
        isSelected = false
    
    NSLayoutConstraint.activate([
        widthAnchor.constraint(equalToConstant: 40),
        heightAnchor.constraint(equalToConstant: 40)
    ])}
    
    }
    
    func configureCheckEpi(){
        
        if globalEpiTimer.timer?.isValid == true{
            setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            isSelected = true
        }
        
        else {
            setBackgroundImage(UIImage(named: "empty_box"), for: .normal)
        
            isSelected = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 40),
            heightAnchor.constraint(equalToConstant: 40)
        ])}
        
        }
    
    
    
    func configureCheck(){
    
            setBackgroundImage(UIImage(named: "empty_box"), for: .normal)
        
            isSelected = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 40),
            heightAnchor.constraint(equalToConstant: 40)
        ])}
        
        
    
    
    func checkOffOn () {
        
        if isSelected == true{
            setBackgroundImage(UIImage(named: "empty_box"), for: .normal)
        
            isSelected = false }
        
        else{
            setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            isSelected = true
        }}
        
        
    
    }
    
    


