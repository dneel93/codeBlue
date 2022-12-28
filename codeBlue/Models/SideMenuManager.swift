//
//  SideMenuManager.swift
//  codeBlue
//
//  Created by Dylan Neel on 12/23/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

protocol MenuControllerDelegate{
    
    func didSelectMenuItem(name:String)
}


class MenuListController:
UITableViewController{

    var items = ["Home","About","ACLS Information","Complete Survey"]
    var delegate: MenuControllerDelegate?


override func viewDidLoad() {
    super.viewDidLoad()
    tableView.backgroundColor = UIColor(red: 0.42, green: 0.46, blue: 0.70, alpha: 1)
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
    
    let selectedItem = items[indexPath.row]
    delegate?.didSelectMenuItem(name: selectedItem)
    

    }

}
