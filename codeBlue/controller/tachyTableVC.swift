//
//  tachyTableVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 10/21/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class tachyTableVC: UITableViewController {

    let sections = ["♥️ Synchronized Cardioversion", "💊 Adenosine IV Infusion", "💊 Antiarrythmic Infusions (stable wide QRS)"]
    
    let cardioversion = ["Narrow regular: 50-100 J", "Narrow irregular: 120-200 J biphasic or 200J monophasic", "Wide regular: 100J", "Wide irregular: defibrillation dose (not synchronized)"]
    
    let adenosine = ["First dose: 6 mg rapid IV push; follow with NS flush", "Second dose: 12mg if needed"]
    
    let antiarryth = ["Procainamide IV dose: 20-50 mg/min, max dose 17 mg/kg", "Amiodarone IV dose: (1) 150 mg over 10 min. Repeat as needed if VT recurs. Follow by maintenance infusion of 1mg/min, first 6 hours.", "Sotalol IV dose: 100mg (1.5mg/kg) over 5 min. Avoid if prolonged QT"]
    
   
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
            case 0: return cardioversion.count
            case 1: return adenosine.count
            case 2: return antiarryth.count
        default: return 1
        
        }
       
    }
    


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        let infos = indexPath.section == 0 ? cardioversion[indexPath.row] : indexPath.section == 1 ? adenosine[indexPath.row] :  antiarryth[indexPath.row]
        
        cell.textLabel?.text=infos
        cell.textLabel?.numberOfLines = 0

        return cell
    }


}

