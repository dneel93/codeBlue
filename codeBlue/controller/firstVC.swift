//
//  firstVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/16/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit
import SideMenu

class firstVC: UIViewController {

    @IBOutlet var guidedCode: UIButton!
    @IBOutlet var aclsAlgo: UIButton!
    var menu: SideMenuNavigationController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guidedCode.layer.cornerRadius = 8
        aclsAlgo.layer.cornerRadius = 8
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide=true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ekg.png")!)
        
    }
    
    
    @IBAction func menuTapped(_ sender: Any) {
        present(menu!, animated:true)
    }
    
    class MenuListController:
    UITableViewController{
    
        var items = ["About","ACLS Information","Help","Complete Survey"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(red: 0.032, green: 0.216, blue: 0.678, alpha: 1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.backgroundColor = .lightText
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if items[indexPath.row] == "Complete Survey"{
            if let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSe2t97vEccy5EJx1MyPb7PiPBBf0-xy0MKEqWJZ7CL5XWcuOw/viewform?usp=sf_link") {
                UIApplication.shared.open(url)
            }
            
        }
        
        }

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
