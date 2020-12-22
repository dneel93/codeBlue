//
//  cardiacArrestVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/17/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class cardiacArrestVC: UIViewController, UIScrollViewDelegate, selectRhythm {

    var rhythmLabelText:String = "Rhythm"
    var timer:Timer!
    var timer2:Timer!
    var timer3:Timer!
    var cprSeconds = 0
    var cprCountNum = 0
    var epiSeconds = 0
    var epiCountNum = 0
    var totalSeconds = 0
    var defibCountNum = 0
    var amioCountNum = 0
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var CPR: UIButton!
    @IBOutlet var EPI: UIButton!
    @IBOutlet var Defib: UIButton!
    @IBOutlet var cprTime: UILabel!
    @IBOutlet var cprCount: UILabel!
    @IBOutlet var epiTime: UILabel!
    @IBOutlet var epiCount: UILabel!
    @IBOutlet var defibCount: UILabel!
    @IBOutlet var rhythmLabel: UILabel!
    
    @IBOutlet var totalTimeButton: UIButton!
    @IBOutlet var totalTime: UILabel!
    
    @IBOutlet var amiCount: UILabel!
    @IBOutlet var rhythmButton: UIButton!
    let image = UIImage(named: "CardiacAlgo_XD")
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cardiac Arrest"
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.addSubview(imageView)
        imageView.image = image                        // setup image to imageView
        imageView.frame.size = image?.size ?? .zero    // setup image size or zero to imageView
        scrollView.contentSize = image?.size ?? .zero
        
    }
    

    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {return imageView}

    
    
    
    
    func didSelectRhythm(name:String) {
        
        rhythmLabelText = name
        rhythmLabel.text = name
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
    
    
    @IBAction func cprPressed(_ sender: Any){
    
        if timer?.isValid ?? false {
            
            timer.invalidate()
        }
        
        else{}
        
    cprSeconds = 0
    startCPR()
    cprCountNum += 1
    cprCount.text = "CPR \(cprCountNum)"}
    
    
    
    @IBAction func epiPressed(_ sender: Any) {
        if timer2?.isValid ?? false {timer2.invalidate()}
              else{}
          epiSeconds = 0
          startEpi()
          epiCountNum += 1
          epiCount.text = "Epi \(epiCountNum)"
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
        amioCountNum = 0
        epiTime.text = "00:00"
        cprTime.text = "00:00"
        epiCount.text = "EPI 0"
        cprCount.text = "CPR 0"
        defibCount.text = "0"
        amiCount.text = "0"
          
}
        
        else {
            startTotalTime()
            totalTimeButton.setTitle("Stop", for: .normal)}
}
        
    
    
    @IBAction func defibPressed(_ sender: Any) {
        
        defibCountNum += 1
        defibCount.text = String(defibCountNum)
        
    }
    
    
    
    @IBAction func amioPressed(_ sender: Any) {
        
        amioCountNum += 1
        amiCount.text = String(amioCountNum)
    }
    
    
    
    @IBAction func rhythmPressed(_ sender: Any) {
        
        let rhythmVC = rhythmTableVC()
        rhythmVC.delegate = self
        self.navigationController!.pushViewController(rhythmVC, animated: true)
    }
    
    
    
    @IBAction func logPressed(_ sender: Any) {
        
        let cprRoundsLog = "CPR rounds: \(cprCountNum)"
        
        let epiDosesLog = "Doses Epi: \(epiCountNum)"
       
        let defibLog = "AED: \(defibCountNum)"
        
        let rhythmLog = "Heart Rhythm: "+rhythmLabelText
        
        let amioLog = "Doses Amio: \(amioCountNum)"
        let totalTimeLog = "Total Time (min): \(Float(totalSeconds)/60)"
        
        let array:[String] = [totalTimeLog,cprRoundsLog,epiDosesLog,defibLog,rhythmLog, amioLog]

        let logVC = logTableVC()
        logVC.LogArray = array
        self.navigationController!.pushViewController(logVC, animated: true)
        
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
