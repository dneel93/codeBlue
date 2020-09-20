//
//  cardiacArrestVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/17/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class cardiacArrestVC: UIViewController {
    
    var timer:Timer!
    var timer2:Timer!
    var timer3:Timer!
    var cprSeconds = 0
    var cprCountNum = 0
    var epiSeconds = 0
    var epiCountNum = 0
    var totalSeconds = 0
    var defibCountNum = 0
    

    @IBOutlet var CPR: UIButton!
    @IBOutlet var EPI: UIButton!
    @IBOutlet var Defib: UIButton!
    @IBOutlet var cprTime: UILabel!
    @IBOutlet var cprCount: UILabel!
    @IBOutlet var epiTime: UILabel!
    @IBOutlet var epiCount: UILabel!
    @IBOutlet var defibCount: UILabel!
    
    @IBOutlet var totalTimeButton: UIButton!
    @IBOutlet var totalTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CPR.layer.cornerRadius = 8
        EPI.layer.cornerRadius = 8
        Defib.layer.cornerRadius = 8
        cprTime.layer.cornerRadius = 8
        cprTime.layer.masksToBounds = true
        epiTime.layer.cornerRadius = 8
        epiTime.layer.masksToBounds = true
        self.navigationItem.title = "Cardiac Arrest"}
    
    
    @IBAction func cprPressed(_ sender: Any){
    
        if timer?.isValid ?? false {timer.invalidate()}
        else{}
    cprSeconds = 0
    startCPR()
    cprCountNum += 1
    cprCount.text = String (cprCountNum)}
    
    
    
    @IBAction func epiPressed(_ sender: Any) {
        if timer2?.isValid ?? false {timer2.invalidate()}
              else{}
          epiSeconds = 0
          startEpi()
          epiCountNum += 1
          epiCount.text = String (epiCountNum)
    }
    
    
    
    @IBAction func totalTimePressed(_ sender: Any) {
        
        if timer3?.isValid ?? false {
            timer3.invalidate()
            totalTimeButton.setTitle("Restart", for: .normal)
            
            
            if timer?.isValid ?? false {timer.invalidate()}
            else{}
                      
            if timer2?.isValid ?? false {timer2.invalidate()}
            else{}
            
        }
        
            
        else if timer3?.isValid == false && totalSeconds > 0 {
            totalSeconds = 0
            totalTime.text = "00:00"
            totalTimeButton.setTitle("Start", for: .normal)
            
        epiSeconds = 0
        cprSeconds = 0
        epiCountNum = 0
        cprCountNum = 0
        defibCountNum = 0
        epiTime.text = "00:00"
        cprTime.text = "00:00"
        epiCount.text = "0"
        cprCount.text = "0"
        defibCount.text = "0"
          
}
        
        else {
            startTotalTime()
            totalTimeButton.setTitle("Stop", for: .normal)}
}
        
    
    
    @IBAction func defibPressed(_ sender: Any) {
        
        defibCountNum += 1
        defibCount.text = String(defibCountNum)
        
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
        cprTime.text = String(format: "%02d:%02d", minutes, seconds)
    }

    
   func startEpi(){
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countup_epi), userInfo: nil, repeats: true)
    }
    
    @objc func countup_epi() {
        epiSeconds += 1
        var minutes: Int
        var seconds: Int
        minutes = (epiSeconds % 3600) / 60
        seconds = (epiSeconds % 3600) % 60
        epiTime.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    
   
    func startTotalTime(){
        timer3 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countup_total), userInfo: nil, repeats: true)
    }
    
    
    @objc func countup_total() {
        totalSeconds += 1
        var minutes: Int
        var seconds: Int
        minutes = (totalSeconds % 3600) / 60
        seconds = (totalSeconds % 3600) % 60
        totalTime.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
}
