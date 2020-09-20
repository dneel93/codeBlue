//
//  firstVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 9/16/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class firstVC: UIViewController {

    @IBOutlet var guidedCode: UIButton!
    
    @IBOutlet var aclsAlgo: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guidedCode.layer.cornerRadius = 8
        aclsAlgo.layer.cornerRadius = 8
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
