//
//  HtDataModel.swift
//  codeBlue
//
//  Created by Dylan Neel on 4/16/21.
//  Copyright © 2021 Dylan Neel. All rights reserved.
//

import UIKit


struct HT {
    
    var name:String
    var status:String
    
}

struct htTable{

static var array:[HT] = [
    
    HT(name: "Hypovolemia", status: "?"),
    HT(name: "Hypoxia", status: "?"),
    HT(name: "H+ (acidosis)", status: "?"),
    HT(name: "Hypokalemia", status: "?"),
    HT(name: "Hyperkalemia", status:"?"),
    HT(name: "Hypothermia", status: "?"),
    
    HT(name: "Tenison PTX", status: "?"),
    HT(name: "Tamponade", status: "?"),
    HT(name: "Toxins", status: "?"),
    HT(name: "Thrombosis (PE)", status: "?"),
    HT(name: "Thrombosis (MI)", status:"?")

]
    
    
}






