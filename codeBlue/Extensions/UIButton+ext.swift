//
//  UIButton+ext.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/18/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

extension UIButton {

func configure(title:String){
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 8
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.titleLabel?.textAlignment = .center}
}


