//
//  UIButton_check+ext.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit


extension UIButton {

func configureCheck(){
        setBackgroundImage(UIImage(named: "empty_box"), for: .normal)
    
        isSelected = false
    
    NSLayoutConstraint.activate([
        widthAnchor.constraint(equalToConstant: 30),
        heightAnchor.constraint(equalToConstant: 30)
        ])
    
    }}

