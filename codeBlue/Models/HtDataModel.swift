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
    var ddx:String
    
}

struct htTable{

static var array:[HT] = [
   
    
    HT(name: "Hypovolemia", status: "?", ddx:"Hypovolemia\n\nDiagnostics: FAST US exam of abdomen\n\nTherapeutics:IV/IO access, IV fluids,Consider blood transfusion"),
    
    HT(name: "Hypoxia", status: "?",ddx:"Hypoxia\n\nDiagnostics:Ensure airway patent, Auscultate for bilateral breath soundsAuscultate for bilateral breath sounds,CXR (when ROSC),Serum tox\n\nTherapeutics: Consider intubation"),
    
    HT(name: "H+ (acidosis)", status: "?",ddx:"Acidosis\n\nDiagnostics: ABG, BMP, Ca, iCa\n\nTherapeutics:Push amps of sodium bicarbonate PRN, Hyperventnilation"),
   
    HT(name: "Hypokalemia", status: "?",ddx:"Hypokalemia\n\nDiagnostics:BMP, ABG, Tele, ECG(when ROSC)\n\nTherapeutics:Magnesium 2-4g IV"),
    
    HT(name: "Hyperkalemia", status:"?",ddx:"Hyperkalemia\n\nDiagnostics:BMP, ABG, Tele, ECG (when ROSC)\n\nTherapeutics:Calcium chloride (cardiac membrane stabilization), Sodium bicarb (for likely acidosis), Insulin 10U + 25g D50"),
    
    HT(name: "Hypothermia", status: "?",ddx:"Hypothermia\n\nTherapeutics: Warming protocol (core T >30C ASAP)"),
    
    HT(name: "Hypoglycemia", status: "?", ddx: "Hypoglycemia\n\nDiagnostics: Fingerstick GB\n\nTherapeutics:D50 bolus"),
    
    HT(name: "Tension PTX", status: "?",ddx:"Tension PTX\n\nDiagnostics: Auscultate for bilateral breath sounds, CXR (when ROSC), Pleural US\n\nTherapeutics:Needle decompression (2nd intercostal space, midclavicular line), Consider thoracostomy"),
    
    HT(name: "Tamponade", status: "?",ddx:"Tamponade\n\nDiagnostics: Bedside TTE\n\nTherapeutics: Bedside pericardiocentesis"),
    HT(name: "Toxins", status: "?",ddx:"Toxins\n\nDiagnostics: Serum tox panel \n\nTherapeutics: Based on specific toxin"),
    HT(name: "Thrombosis (PE)", status: "?",ddx:"Thrombosis PE\n\nDiagnostics: D-Dimer\n\nTherapeutics:Consider tPA, Consider surgical embolectomy"),
    HT(name: "Thrombosis (MI)", status:"?",ddx:"Thrombosis\n\nDiagnostics: ECG (when ROSC) \n\nTherapeutics: PCI vs. tPA")
]
    
    
}






