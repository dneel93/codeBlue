//
//  vfVT.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/3/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class vfVT: UIViewController {

    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    
    @IBOutlet var shockButton: UIButton!
    
    @IBOutlet var cprButton: UIButton!
    
    @IBOutlet var accessButton: UIButton!
    
    @IBOutlet var cprLabel: UILabel!
    
    var cprSeconds = 0
    var timer:Timer!
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        noButton.layer.cornerRadius = 8
        yesButton.layer.cornerRadius = 8
        shockButton.configureCheck()
        cprButton.configureCheck()
        accessButton.configureCheck()
        
    }
    

    @IBAction func yesPressed(_ sender: Any) {
    
        
    }
    
    
    @IBAction func noPressed(_ sender: Any) {
     
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "asystolePEA") as! asystolePEA
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    
    @IBAction func shockPressed(_ sender: Any) {
        if shockButton.isSelected == true{
            shockButton.configureCheck()}
        
        else{
            shockButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            shockButton.isSelected = true}
    }
    
    
    @IBAction func cprPressed(_ sender: Any) {
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
    
    
    @IBAction func accessPressed(_ sender: Any) {
    
        if accessButton.isSelected == true{
            accessButton.configureCheck()}
        
        else{
            accessButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            accessButton.isSelected = true}
    
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
    
    

