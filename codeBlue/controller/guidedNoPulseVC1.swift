//
//  guidedNoPulseVC1.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class guidedNoPulseVC1: UIViewController {

    @IBOutlet var cprButton: UIButton!
    @IBOutlet var o2Button: UIButton!
    @IBOutlet var defibButton: UIButton!
    @IBOutlet var cprLabel: UILabel!
    var cprSeconds = 0
    var timer:Timer!
    
    
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noButton.configure(title: "No")
        yesButton.configure(title: "Yes")
        cprButton.configureCheck()
        o2Button.configureCheck()
        defibButton.configureCheck()
        
        
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
        
    
    @IBAction func o2Press(_ sender: Any) {
    
        o2Button.checkOffOn()
    }
        
    
    
    
    @IBAction func defibPress(_ sender: Any) {
        defibButton.checkOffOn()
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
    
    
    
    

    
   
   

    
    

    

