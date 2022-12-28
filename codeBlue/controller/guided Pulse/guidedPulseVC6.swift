//
//  guidedPulseVC6.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/9/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class guidedPulseVC6: UIViewController {

    
    @IBOutlet weak var cardio: PaddingLabel!
    var card = true
    
    @IBOutlet weak var sedation: PaddingLabel!
    var sed = true

    @IBOutlet weak var adenosine: PaddingLabel!
    var adeno = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adenosine.configureLabel()
        sedation.configureLabel()
        cardio.configureLabel()
        
        let tapAdenosine = UITapGestureRecognizer(target: self, action: #selector(tapFunctionAdeno))
        adenosine.addGestureRecognizer(tapAdenosine)
        
        let tapCardio = UITapGestureRecognizer(target: self, action: #selector(tapFunctionCardio))
        cardio.addGestureRecognizer(tapCardio)
        
        let tapSedate = UITapGestureRecognizer(target: self, action: #selector(tapFunctionSedate))
        sedation.addGestureRecognizer(tapSedate)
    }
    
    @IBAction func homeTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    @objc func tapFunctionAdeno(sender:UITapGestureRecognizer) {
        if adeno == true{
            adenosine
                .text = "Adenosine:\nFirst dose: 6mg rapid IV push\nSecond dose: 12mg if needed"
        }
        
        else{
            adenosine.text = "Adenosine"}
        
        adeno = !adeno
    }
    
    
    @objc func tapFunctionCardio(sender:UITapGestureRecognizer) {
        if card == true{
            cardio
                .text = "Cardioversion:\nNarrow regular: 50-100J\nNarrow irregular: 120-200J biphasic or 200J monophasic\nWide regular: 100J\nWide irregular: defib (not synchronized)"
        }
        
        else{
            cardio.text = "Synchronized Cardioversion"}
        
        card = !card
    }
    
    
    @objc func tapFunctionSedate(sender:UITapGestureRecognizer) {
        if sed == true{
            sedation
                .text = "Sedation:\nMidazolam: 1-2mg IV\nFentanyl: 25-100mcg IV"}
        
        else{
            sedation.text = "Sedation"
        }
        sed = !sed
    }
    

   

}
