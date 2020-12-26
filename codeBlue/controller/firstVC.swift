//
//  firstVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/16/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit
import SideMenu

class firstVC: UIViewController, MenuControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var guidedCode: UIButton!
    @IBOutlet var aclsAlgo: UIButton!
    var SideMenu: SideMenuNavigationController?
    
    
    @IBOutlet var ACLS: UIView!
    
    @IBOutlet var About: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guidedCode.layer.cornerRadius = 8
        aclsAlgo.layer.cornerRadius = 8
        let menu = MenuListController()
        menu.delegate = self
        SideMenu = SideMenuNavigationController(rootViewController: menu)
        SideMenu?.leftSide=true
        SideMenu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = SideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        self.ACLS.isHidden = true
        self.About.isHidden = true
       
    
    }
    
    
    
    func didSelectMenuItem(name: String) {
        SideMenu?.dismiss(animated:true, completion:{[weak self] in
            
            if name == "About"{
                
                self?.ACLS.isHidden = true
                self?.About.isHidden = false

            }
            
            else if name == "ACLS Information"{
               
                self?.ACLS.isHidden = false
                self?.About.isHidden = true
            }
            
            else if name == "Home"{
                
                self?.ACLS.isHidden = true
                self?.About.isHidden = true
            }
           
            else if name == "Complete Survey"{
                
                self?.ACLS.isHidden = true
                self?.About.isHidden = true
               if let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSe2t97vEccy5EJx1MyPb7PiPBBf0-xy0MKEqWJZ7CL5XWcuOw/viewform?usp=sf_link") {
                    UIApplication.shared.open(url)}
            }
        })
        
    }

    
   
    @IBAction func menuTapped(_ sender: Any) {
        present(SideMenu!, animated:true)
    }
    
    
    @IBAction func guidedPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "guided", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "guided") as! guided1VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func algosPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Algos", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "algoVC") as! algoVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


