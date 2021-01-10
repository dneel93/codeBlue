//
//  bradyTableVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 10/21/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class bradyTableVC: UITableViewController {

    let sections = ["Atropine IV dose", "Dopamine IV Infusion", "Epi IV Infusion"]
    
    let atropine = ["First Dose: 1mg bolus (AHA 2020 update)", "Repat every 3-5 min", "Maximum 3 mg"]
    
    let dopa = ["Usual infusion rate is 5-20mcg/min (AHA 2020 update)", "Titrate to patient response, taper slowly"]
    
    let epi = ["2-20 mcg/min infusion", "Titrate to patient response"]
    
   
    let colorBlue = UIColor(red: 0.027, green: 0.226, blue: 0.651, alpha: 1)
    
    

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
            case 0: return atropine.count
            case 1: return dopa.count
            case 2: return epi.count
        default: return 1
        
        }
       
    }
    


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        let infos = indexPath.section == 0 ? atropine[indexPath.row] : indexPath.section == 1 ? dopa[indexPath.row] :  epi[indexPath.row]
        
        cell.textLabel?.text=infos
        cell.textLabel?.numberOfLines = 0

        return cell
    }


}
