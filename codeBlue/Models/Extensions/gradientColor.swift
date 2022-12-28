//
//  gradientColor.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/9/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//


import UIKit

extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }

    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        
        gradient.cornerRadius = 10
        return gradient
    }
}
