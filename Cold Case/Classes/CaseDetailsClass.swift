//
//  CaseDetailsClass.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/20/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation


class CaseDetails {
    let caseName: String
    let caseSummary: String
    var soundEffects: Bool //Enable or disable sound effects for this object
    
    init(caseName: String, caseSummary: String, soundEffects: Bool) {
        self.caseName = caseName
        self.caseSummary = caseSummary
        self.soundEffects = soundEffects
    }
    
}

