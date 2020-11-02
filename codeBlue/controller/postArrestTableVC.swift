//
//  postArrestTableVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 10/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class postArrestTableVC: UITableViewController {

    let sections = ["Ventilation/oxygenation", "IV bolus", "Epi IV Infusion", "Dopamine IV Infusion", "Norepi IV Infusion"]
    
    let vent = ["Avoid excesive ventilation", "Start 10 breaths/min and titrate to target PetCO2","When feasible, titrate Fi02 to minimum necessary to achieve SpO2 >94%"]
    
    let bolus = ["Approx 1-2 L normal saline or lactated Ringers"]
    
    let epi = ["0.1-0.5 mcg/kg per minute (70kg adults: 7-35 mcg per min)"]
    
    let dopa = ["5-10 mcg/kg per minute"]
    
    let norepi = ["0.1-0.5 mcg/kg minute (in 70-kg adult: 7-35 mcg per minute)"]
  
    let colorBlue = UIColor(red: 0, green: 0.0314, blue: 0.9569, alpha: 1)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = colorBlue
        label.text = "   \(sections[section])"
        label.textColor = .white
        return label
    }
    


    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
            case 0: return vent.count
            case 1: return bolus.count
            case 2: return epi.count
            case 3: return dopa.count
            case 4: return norepi.count
        default: return 1
        
        }
       
    }
    


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        let infos = indexPath.section == 0 ? vent[indexPath.row] : indexPath.section == 1 ? bolus[indexPath.row] : indexPath.section == 2 ? epi[indexPath.row]: indexPath.section == 3 ? dopa[indexPath.row]: norepi[indexPath.row]
        
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

