//
//  vfEpi.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/3/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class vfEpi: UIViewController {
    
    
    @IBOutlet var noButton: UIButton!
    
    @IBOutlet var yesButton: UIButton!
    
    @IBOutlet var cprButton: UIButton!
    
    
    @IBOutlet var cprLabel: UILabel!
    
    @IBOutlet var epiButton: UIButton!
    
    @IBOutlet var intButton: UIButton!
    
    var cprSeconds = 0
    var timer:Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noButton.layer.cornerRadius = 8
        yesButton.layer.cornerRadius = 8
        cprButton.configureCheck()
        epiButton.configureCheck()
        intButton.configureCheck()

    }
    

    @IBAction func noPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "guidedNoPulse", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "asystolePEA") as! asystolePEA
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    
    @IBAction func epiPressed(_ sender: Any) {
        epiButton.checkOffOn()
    }
    
    
    @IBAction func intPressed(_ sender: Any) {
        intButton.checkOffOn()
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
