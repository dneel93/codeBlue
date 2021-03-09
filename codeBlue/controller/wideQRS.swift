//
//  wideQRS.swift
//  codeBlue
//
//  Created by Dylan Neel on 3/1/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

class wideQRS: UIViewController {

    @IBOutlet weak var procain: PaddingLabel!
    var pro:Bool = true
    
   
    @IBOutlet weak var amiodarone: PaddingLabel!
    var amiod:Bool = true
    
    @IBOutlet weak var sotalol: PaddingLabel!
    var sota = true
    

    @IBOutlet weak var adenosine: PaddingLabel!
    var adeno = true
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapAdenosine = UITapGestureRecognizer(target: self, action: #selector(tapFunctionAdeno))
        adenosine.addGestureRecognizer(tapAdenosine)
        
        let tapProcain = UITapGestureRecognizer(target: self, action: #selector(tapFunctionProcain))
        procain.addGestureRecognizer(tapProcain)
        
        let tapSotalol = UITapGestureRecognizer(target: self, action: #selector(tapFunctionSota))
        sotalol.addGestureRecognizer(tapSotalol)
        
        let tapAmiodarone = UITapGestureRecognizer(target: self, action: #selector(tapFunctionAmiodarone))
       amiodarone.addGestureRecognizer(tapAmiodarone)
        
        procain.configureLabel()
        adenosine.configureLabel()
        sotalol.configureLabel()
        amiodarone.configureLabel()
        
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pro = true
        amiod = true
        sota = true
        adeno = true
    }
    
    @objc func tapFunctionAdeno(sender:UITapGestureRecognizer) {
        if adeno == true{
            adenosine
                .text = "Adenosine:\nFirst dose: 6mg rapid IV push followed by NS flush.\nSecond dose: 12mg if needed"
            
        }
        
        else{
            adenosine.text = "Adenosine"
        }
        
        adeno = !adeno
    }
    
    
    @objc func tapFunctionProcain(sender:UITapGestureRecognizer) {
        if pro == true{
            procain
                .text = "20-50mg/min IV until arrhythmia suppressed, hypotension ensues, QRS duration increases >50%, or maximum dose 17mg/kg given\nMaintenance infusion: 1-4mg/min IV\nAvoid if prolonged QT or CHF"
        }
        
        else{
            procain.text = "Procain"
        }
        pro = !pro
    }
    
    @objc func tapFunctionAmiodarone(sender:UITapGestureRecognizer) {
        if amiod == true{
            amiodarone
                .text = "First dose: 150mg IV over 10min\nRepeat as needed if VT recurs\nMaintenance infusion: 1mg/min IV for first 6hrs"
            
        }
        
        else{
            amiodarone.text = "Amiodarone"
    
        }
        
        amiod = !amiod
    }
    
    @objc func tapFunctionSota(sender:UITapGestureRecognizer) {
        if sota == true{
            sotalol
                .text = "100mg (1.5mg/kg) IV over 5min\nAvoid if prolonged QT"
        }
        
        else{
            sotalol.text = "Sotalol"
            }
        
        sota = !sota
    }
    
        
    


   
    
}
