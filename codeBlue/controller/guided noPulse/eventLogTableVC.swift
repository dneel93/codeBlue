//
//  eventLogTableVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 5/31/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit

class eventLogTableVC: UITableViewController {
    
    var guidedLogArray:[String] = []

    let cprRoundsLog = "CPR rounds: \(globalCounter.cprCountGlobal)"
    
    let epiDosesLog = "Doses Epi: \(globalCounter.epiCountGlobal)"
   
    let defibLog = "AED: \(globalCounter.defibCountGlobal)"
    
    
    let amioLog = "Doses Amio: \(globalCounter.amioCountGlobal)"
    
    let totalTime = Float(globalCounter.globalTimeCounter)/60
    
    var Date:String=""
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let totalTimeLog = String(format: "Total time (min): %.2f", totalTime)
        let array:[String] = [totalTimeLog,cprRoundsLog,epiDosesLog,defibLog, amioLog]
        guidedLogArray = array
        Date=self.getDate()
        
    }
    
    func getDate()->String{
        
        let Date = Foundation.Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: Date)
        let month = calendar.component(.month, from: Date)
        let day = calendar.component(.day, from: Date)
        
        let date = "\(month)/\(day)/\(year)"
        
        return date
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let sectionName1 = "Event Summary: \(Date)"
        let sectionName2 = "Event Log: \(Date)"
        
        if section == 0{
            return sectionName1}
        else {return sectionName2}
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor(red: CGFloat(111.0/255.0), green: CGFloat(128.0/255.0), blue: CGFloat(218.0/255.0), alpha: 1.0)
        
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = .white
    }
    
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
        return guidedLogArray.count}
        else {return eventLog.eventTime.count}
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        
        let infos = indexPath.section == 0 ? guidedLogArray[indexPath.row] : eventLog.eventTime[indexPath.row]
        
        
        cell.textLabel?.text = infos
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
