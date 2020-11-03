//
//  cardiacTableVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 10/18/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class cardiacTableVC: UITableViewController {

    let sections = ["♥️ CPR Quality", "💊 Shock Energy for Defib", "♥️ Advanced Airway", "💊 Drug Therapy", "♥️ ROSC","♥️ Reversible Causes"]
    
    let cpr = ["Push hard (at least 2 inches [5 cm]) and fast (100-120/min) and allow complete chest recoil", "Minimize interruptions in compressions. Avoid excessive ventilation", " Change compressor every 2 minutes, or sooner if fatigued.", "If no advanced airway, 30:2 compression-ventilation ratio.Quantitative waveform capnography", "If PetCO2 <10 mm Hg, attempt to improve CPR quality.", "Intra-arterial pressure: if relaxation phase (diastolic) pressure <20 mm Hg, attempt to improve CPR quality." ]
    
    
    let defib = [" Biphasic: Manufacturer recommendation (eg, initial dose of 120-200 J); if unknown, use maximum available. Second and subsequent doses should be equivalent, and higher doses may be considered.","Monophasic: 360 J"]
    
    
    let airway = ["Minimize closed-circuit disconnection", "Use intubator with highest likelihood of first pass success", "Consider video laryngoscopy", "Endotracheal intubation or supraglottic advanced airway", "Waveform capnography or capnometry to confirm and monitor ET tube placement", "Once advanced airway in place, give 1 breath every 6 seconds (10 breaths/min) with continuous chest compression"]
    
    
    let drugs = ["Epinephrine IV/IO dose: 1 mg every 3-5 minutes", "Amiodarone IV/IO dose: First dose: 300 mg bolus. Second dose: 150 mg", "or Lidocaine IV/IO dose: First dose: 1-1.5 mg/kg. Second dose: 0.5-0.75 mg/kg"]
    let rosc = ["Pulse and blood pressure", "Abrupt sustained increase in Petco2 (typically ≥40 mm Hg)", "Spontaneous arterial pressure waves with intra-arterial monitoring"]
    let causes = ["Hypovolemia", "Hypoxia", "Hydrogen ion (acidosis)", "Hypo-/hyperkalemia", "Hypothermia", "Tension pneumothorax", "Tamponade, cardiac", "Toxins","Thrombosis, pulmonary", "Thrombosis, cardiac"]
        
    
    let colorBlue = UIColor(red: 0, green: 0.0314, blue: 0.9569, alpha: 1)
    
    
    

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
        label.text = "   \(sections[section])"
        label.textColor = .white
        return label
    }
    


    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
            case 0: return cpr.count
            case 1: return defib.count
            case 2: return airway.count
            case 3: return drugs.count
            case 4: return rosc.count
            case 5: return causes.count
        default: return 1
        
        }
       
    }
    


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        let infos = indexPath.section == 0 ? cpr[indexPath.row] : indexPath.section == 1 ? defib[indexPath.row] : indexPath.section == 2 ? airway[indexPath.row]: indexPath.section == 3 ? drugs[indexPath.row]: indexPath.section == 4 ? rosc[indexPath.row]: causes[indexPath.row]
        
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
