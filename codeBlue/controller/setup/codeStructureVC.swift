//
//  codeStructureVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 1/29/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

class codeStructureVC: UIViewController {

    
    
    @IBOutlet var lungButton: UIButton!
    @IBOutlet var cprButton: UIButton!
    @IBOutlet var defibButton: UIButton!
    @IBOutlet var medsButton: UIButton!
    @IBOutlet var scribeButton: UIButton!
    @IBOutlet var leaderButton: UIButton!
    
    @IBOutlet var backButton: UIButton!
    
//    CHECKS
    
    
    @IBOutlet var checkAir: UIImageView!
    
    @IBOutlet var checkCPR: UIImageView!
    
    @IBOutlet var checkDefib: UIImageView!
    
    @IBOutlet var checkMeds: UIImageView!
    
    @IBOutlet var checkScribe: UIImageView!
    
    @IBOutlet var checkLeader: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func lungPressed(_ sender: Any) {
        
        
        if lungButton.isSelected == true{
            checkAir.image = UIImage(named: "white")
            lungButton.isSelected = false
        
        }
        
        else{
            checkAir.image = UIImage(named: "green_check")
            lungButton.isSelected = true
            
            
        }
        
        
 }
    
    
    
    @IBAction func backPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

    
    @IBAction func cprPressed(_ sender: Any) {
        
        if cprButton.isSelected == true{
            checkCPR.image = UIImage(named: "white")
            cprButton.isSelected = false
        
        }
        
        else{
            checkCPR.image = UIImage(named: "green_check")
            cprButton.isSelected = true
            
            
        }
        }
    
    
    
    
    @IBAction func defibPressed(_ sender: Any) {
        
        if defibButton.isSelected == true{
            checkDefib.image = UIImage(named: "white")
            defibButton.isSelected = false
        
        }
        
        else{
            checkDefib.image = UIImage(named: "green_check")
            defibButton.isSelected = true
            
            
        }
       
        
    }
    
    
    @IBAction func medsPressed(_ sender: Any) {
        if medsButton.isSelected == true{
            checkMeds.image = UIImage(named: "white")
            medsButton.isSelected = false
        
        }
        
        else{
            checkMeds.image = UIImage(named: "green_check")
            medsButton.isSelected = true
            
            
        }
    }
    
    
    @IBAction func scribePressed(_ sender: Any) {
        if scribeButton.isSelected == true{
            checkScribe.image = UIImage(named: "white")
            scribeButton.isSelected = false
        
        }
        
        else{
            checkScribe.image = UIImage(named: "green_check")
            scribeButton.isSelected = true
        }
      
        
    }
    
    
    @IBAction func leaderPressed(_ sender: Any) {
        
        if leaderButton.isSelected == true{
            checkLeader.image = UIImage(named: "white")
           leaderButton.isSelected = false
        
        }
        
        else{
            checkLeader.image = UIImage(named: "green_check")
            leaderButton.isSelected = true
            
            
        }
        
        
        }
    
    
}
    
    



