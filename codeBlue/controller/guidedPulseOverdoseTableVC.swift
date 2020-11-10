//
//  guidedPulseOverdoseTableVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 10/11/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class guidedPulseOverdoseTableVC: UITableViewController {
    
    
    let drugs = ["Beta-blocker", "Ca++ channel-blocker", "Digoxin"]
    
    let beta = ["1st line: glucagon 5mg IV over 1 min, second bolus in 10min if no effect. If effective, start gtt at 2-5mg/hr (MAP>60)", "2nd line: Ca-culconate 2g PVI, CaCl2 1g CVC"]
    let calcium = ["1st line: Ca-gluconate 2g PIV, CaCl2 1g CVC ", "Glucagon (as above)"]
    let digoxin = ["Give Ab (FAb, Digibind)", "Can try atropine 0.5mg IV while waiting","Correct hypokalemia"]
    
    let colorBlue = UIColor(red: 0.027, green: 0.226, blue: 0.651, alpha: 1)
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = colorBlue
        label.text = "   \(drugs[section])"
        label.textColor = .white
        return label
    }
    


    override func numberOfSections(in tableView: UITableView) -> Int {
        return drugs.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {return beta.count}
        else if section == 1 {return calcium.count}
        else if section == 2 {return digoxin.count}
        else {return 3}
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        let infos = indexPath.section == 0 ? beta[indexPath.row] : indexPath.section == 1 ? calcium[indexPath.row] : digoxin[indexPath.row]
        
        cell.textLabel?.text=infos
        cell.textLabel?.numberOfLines = 0

        return cell
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
