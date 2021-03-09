//
//  guidedNarrowQRS.swift
//  codeBlue
//
//  Created by Dylan Neel on 2/28/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

class narrowQRS:UIViewController{
    
    
    @IBOutlet weak var betaBlock: PaddingLabel!
    var beta:Bool = true
   
    @IBOutlet weak var calcium: PaddingLabel!
    var calc:Bool = true
 
    @IBOutlet weak var adenosine: PaddingLabel!
    var aden:Bool = true
    
    @IBOutlet weak var digoxin: PaddingLabel!
    var dig:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        betaBlock.configureLabel()
        calcium.configureLabel()
        adenosine.configureLabel()
        digoxin.configureLabel()
        
        let tapBeta = UITapGestureRecognizer(target: self, action: #selector(tapFunctionBeta))
        betaBlock.addGestureRecognizer(tapBeta)
        
        let tapCa = UITapGestureRecognizer(target: self, action: #selector(tapFunctionCalcium))
        calcium.addGestureRecognizer(tapCa)
        
        let tapAdeno = UITapGestureRecognizer(target: self, action: #selector(tapFunctionAdeno))
        adenosine.addGestureRecognizer(tapAdeno)
        
        let tapDig = UITapGestureRecognizer(target: self, action: #selector(tapFunctionDig))
       digoxin.addGestureRecognizer(tapDig)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        beta = true
        calc = true
        aden = true
        dig = true
    }
    
    
    
    @objc func tapFunctionBeta(sender:UITapGestureRecognizer) {
        
        if beta == true{
            betaBlock.text = "Metoprolol 5mg IV\nq5min up to 3x\nEsmolol 0.5mg/kg over 1min\nthen gtt 50mcg/kg/min"
        }
        
        else if beta == false{
            betaBlock.text = "Beta Blocker"
            
        }
        
        beta = !beta
       
    }
    
    
    
    @objc func tapFunctionCalcium(sender:UITapGestureRecognizer) {
        
        if calc == true{
            calcium.text = "Diltiazem 10-20mg IV over 2min then q15min x2\nthen 5-20mg/hr gtt"
            
        }
        
        else if calc == false{
            calcium.text = "Ca++ Channel Blocker"
        }
        
       calc = !calc
       
    }
    
    


    
    
    @objc func tapFunctionAdeno(sender:UITapGestureRecognizer) {
        if aden == true{
            adenosine
                .text = "Adenosine 6mg IV\nconsider 12mg IV if second dose needed"
        }
        
        else{
            adenosine.text = "Adenosine (if regular)"
        }
        aden = !aden
    }
    
    
    @objc func tapFunctionDig(sender:UITapGestureRecognizer) {
        if dig == true{
            digoxin
                .text = "Digoxin load with 0.5mg IVx1\n then 0.25mg IV q6hrs x2 then PO"
        }
        
        else{
            digoxin.text = "Digoxin"
        }
        
        dig = !dig
    }
    
    

    
    
}
