//
//  HTcausesTableVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 11/2/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class HTcausesTableVC: UITableViewController {
    
    var selectedIndex = IndexPath(row: -1, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "htCell")
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 300
        
        
    }


    

//    Table View delegate methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return htTable.array.count
    }

    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "htCell", for: indexPath) as! TableViewCell
        
        
        let names = htTable.array[indexPath.row].name
        cell.name = names
        
        let status = htTable.array[indexPath.row].status
        
        let ddx = htTable.array[indexPath.row].ddx
        cell.ddx = ddx
        
        
        cell.label.text = names
        cell.statusLabel.text = status
        cell.label.numberOfLines = 0
        cell.statusLabel.numberOfLines = 0
        cell.setColor()
        
        cell.arrowButtonTapped = { (button:UIButton) -> Void in
           
            
            if cell.expanded == false{
                cell.label.text = ddx
                cell.expanded = true
            }
            
            else{
                cell.label.text = names
                cell.expanded = false
            }
                        tableView.beginUpdates()
            
                        tableView.endUpdates()
        }
        
        
        
        if selectedIndex == indexPath {
        
            let p = cell.statusLabel.text
            
            switch p {
            
            case "?": cell.statusLabel.text = "Ruled out"
                
                cell.statusLabel.backgroundColor = .systemRed
                
                htTable.array[indexPath.row].status="Ruled out"
            
            case "Ruled out": cell.statusLabel.text = "Ruled in"
                cell.statusLabel.backgroundColor = .systemGreen
                htTable.array[indexPath.row].status="Ruled in"
                
            case "Ruled in": cell.statusLabel.text = "?"
                cell.statusLabel.backgroundColor = .systemIndigo
                
                htTable.array[indexPath.row].status="?"
            
                
            default: cell.statusLabel.text = "?"
                cell.statusLabel.backgroundColor = .systemIndigo
                htTable.array[indexPath.row].status="?"
            
            }

        }
        
        return cell
        
        
        
    }
    
    
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        selectedIndex = indexPath
                
        tableView.reloadRows(at: [selectedIndex], with:.automatic)
        
        
    }
    
    
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


