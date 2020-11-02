//
//  asystolePEA.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/2/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class asystolePEA: UIViewController {

    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var accessButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var epiButton: UIButton!
    @IBOutlet var intubationButton: UIButton!
    
    var cprSeconds = 0
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noButton.configure(title: "No")
        yesButton.configure(title: "Yes")
        cprButton.configureCheck()
        accessButton.configureCheck()
        epiButton.configureCheck()
        intubationButton.configureCheck()
    }
    
    
    
    @IBAction func cprPress(_ sender: Any) {
    
        
        
        if cprButton.isSelected == true{
            cprButton.configureCheck()}
        
        else{
            cprButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            cprButton.isSelected = true}
        
        
        if timer?.isValid ?? false {
            timer.invalidate()
            cprLabel.text = "Start CPR"
        }
        
        else{
            cprSeconds = 0
            startCPR()
        }
        
    }
    
    
    
    @IBAction func accessPress(_ sender: Any) {
        if accessButton.isSelected == true{
            accessButton.configureCheck()}
        
        else{
            accessButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            accessButton.isSelected = true}
    }
    
    
    
    @IBAction func epiPressed(_ sender: Any) {
        
        if epiButton.isSelected == true{
            epiButton.configureCheck()}
        
        else{
            epiButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            epiButton.isSelected = true}
        
    }
    
    
    
    @IBAction func intPressed(_ sender: Any) {
        if intubationButton.isSelected == true{
            intubationButton.configureCheck()}
        
        else{
            intubationButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            intubationButton.isSelected = true}
        
    }
    
    
    func startCPR(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
    }
    
    
    @objc func countup() {
        cprSeconds += 1
        var minutes: Int
        var seconds: Int
        minutes = (cprSeconds % 3600) / 60
        seconds = (cprSeconds % 3600) % 60
        cprLabel.text = String(format: "CPR: %02d:%02d", minutes, seconds)
    }
    

    
    

}
