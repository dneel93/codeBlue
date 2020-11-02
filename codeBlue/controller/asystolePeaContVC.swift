//
//  asystolePeaContVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/2/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class asystolePeaContVC: UIViewController {
   
    @IBOutlet var cprLabel: UILabel!
    @IBOutlet var cprButton: UIButton!
  
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    
    @IBOutlet var causesButton: UIButton!
    
  
    
    var cprSeconds = 0
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noButton.configure(title: "No")
        yesButton.configure(title: "Yes")
        cprButton.configureCheck()
        causesButton.configureCheck()

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
    
    
    
    @IBAction func causesPress(_ sender: Any) {
        
        if causesButton.isSelected == true{
            causesButton.configureCheck()}
        
        else{
            causesButton.setBackgroundImage(UIImage(named: "checked_box"), for: .normal)
            causesButton.isSelected = true}
        
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
    

    
    @IBAction func noPressed(_ sender: Any) {
    
        if let viewController = UIStoryboard(name: "guidedNoPulse", bundle: nil).instantiateViewController(withIdentifier: "asystolePEA") as? asystolePEA {
            navigationController?.pushViewController(viewController, animated: true)}}
    
    
    
    @IBAction func yesPressed(_ sender: Any) {
        print("YES")
    }
    
    
    

}
