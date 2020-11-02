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
        
    }
    
    
    @IBAction func menuTapped(_ sender: Any) {
        present(menu!, animated:true)
    }
    
   
    
   
    
    
    
    
    class MenuListController:
    UITableViewController{
    
    var items = ["About","ACLS Information","Help"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .blue
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
        //do something
        }

    }}
