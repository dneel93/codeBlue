//
//  guidedPulseVC5.swift
//  codeBlue
//
//  Created by Dylan Neel on 10/11/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class guidedPulseVC5: UIViewController {

    
    @IBOutlet var overdoseButton: UIButton!
    @IBOutlet var Pacing: UIButton!
    var dop = true
    var epi = true
    
    @IBOutlet weak var dopamine: PaddingLabel!
    @IBOutlet weak var epinephrine: PaddingLabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overdoseButton.configure(title: "Overdose DDx")
        Pacing.configure(title: "Pacing")
        dopamine.configureLabel()
        epinephrine.configureLabel()
        let tapDop = UITapGestureRecognizer(target: self, action: #selector(tapFunctionDopamine))
        dopamine.addGestureRecognizer(tapDop)
        
        let tapEpi = UITapGestureRecognizer(target: self, action: #selector(tapFunctionEpi))
        epinephrine.addGestureRecognizer(tapEpi)
    }
    
    @IBAction func homeTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @objc func tapFunctionDopamine(sender:UITapGestureRecognizer) {
        if dop == true{
            dopamine
                .text = "Dop gtt 2-20mcg/kg/min\ntitrate to patient response\ntaper slowly"
        }
        
        else{
            dopamine.text = "Dopamine infusion"
        }
        dop = !dop
    }
    
    
    @objc func tapFunctionEpi(sender:UITapGestureRecognizer) {
        if epi == true{
            epinephrine
                .text = "Epi gtt 2-10mcg/min\ntitrate to patient response"

        }
        
        else{
            epinephrine.text = "Epi infusion"
        }
        epi = !epi
    }
    
    

}
