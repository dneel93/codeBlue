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
   
    
    HT(name: "\nHypovolemia\n", status: "?", ddx:"Hypovolemia\n\nDiagnostics:\nFAST US exam of abdomen\n\nTherapeutics:\nIV/IO access\nIV fluids\nConsider blood transfusion"),
    
    HT(name: "\nHypoxia\n", status: "?",ddx:"Hypoxia\n\nDiagnostics:\nEnsure airway patent\n Auscultate for bilateral breath sounds\nCXR (when ROSC)\nSerum tox\n\nTherapeutics:\nConsider intubation"),
    
    HT(name: "\nH+ (acidosis)\n", status: "?",ddx:"Acidosis\n\nDiagnostics:\nABG, BMP, Ca, iCa\n\nTherapeutics:\nPush amps of sodium bicarbonate PRN\nHyperventnilation"),
   
    HT(name: "\nHypokalemia\n", status: "?",ddx:"Hypokalemia\n\nDiagnostics:\nBMP, ABG, Tele, ECG(when ROSC)\n\nTherapeutics:\nMagnesium 2-4g IV"),
    
    HT(name: "\nHyperkalemia\n", status:"?",ddx:"Hyperkalemia\n\nDiagnostics:\nBMP, ABG, Tele, ECG (when ROSC)\n\nTherapeutics:\nCalcium chloride (cardiac membrane stabilization)\nSodium bicarb (for likely acidosis)\nInsulin 10U + 25g D50"),
    
    HT(name: "\nHypothermia\n", status: "?",ddx:"Hypothermia\n\nTherapeutics:\nWarming protocol (core T >30C ASAP)"),
    
    HT(name: "\nHypoglycemia\n", status: "?", ddx: "Hypoglycemia\n\nDiagnostics:\nFingerstick GB\n\nTherapeutics:\nD50 bolus"),
    
    HT(name: "\nTension PTX\n", status: "?",ddx:"Tension PTX\n\nDiagnostics:\nAuscultate for bilateral breath sounds\nCXR (when ROSC)\nPleural US\n\nTherapeutics:\nNeedle decompression (2nd intercostal space, midclavicular line)\nConsider thoracostomy"),
    
    HT(name: "\nTamponade\n", status: "?",ddx:"Tamponade\n\nDiagnostics:\nBedside TTE\n\nTherapeutics:\nBedside pericardiocentesis"),
    HT(name: "\nToxins\n", status: "?",ddx:"Toxins\n\nDiagnostics:\nSerum tox panel \n\nTherapeutics:\nBased on specific toxin"),
    HT(name: "\nThrombosis (PE)\n", status: "?",ddx:"Thrombosis PE\n\nDiagnostics:\nD-Dimer\n\nTherapeutics:\nConsider tPA\nConsider surgical embolectomy"),
    HT(name: "\nThrombosis (MI)\n", status:"?",ddx:"Thrombosis\n\nDiagnostics:\nECG (when ROSC) \n\nTherapeutics:\nPCI vs. tPA")
]
    
    
}






