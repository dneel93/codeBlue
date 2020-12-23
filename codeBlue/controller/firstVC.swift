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
    let About = AboutVC()
    let ACLS = AclsInfoVC()
    
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
        addChildVC()
        
    }
    
    func addChildVC(){
    
    addChild(About)
    addChild(ACLS)
        view.addSubview(About.view)
        view.addSubview(ACLS.view)
        About.view.frame = view.bounds
        ACLS.view.frame = view.bounds
        About.didMove(toParent: self)
        ACLS.didMove(toParent: self)
        About.view.isHidden = true
        ACLS.view.isHidden = true
    }
    
    func didSelectMenuItem(name: String) {
        SideMenu?.dismiss(animated:true, completion:{[weak self] in
            
            if name == "About"{
                self?.About.view.isHidden = false
                self?.ACLS.view.isHidden = true
            }
            
            else if name == "ACLS Information"{
                self?.About.view.isHidden = true
                self?.ACLS.view.isHidden = false
            }
            
            else if name == "Home"{
                self?.About.view.isHidden = true
                self?.ACLS.view.isHidden = true
            }
           
            else if name == "Complete Survey"{
                self?.About.view.isHidden = true
                self?.ACLS.view.isHidden = true
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


