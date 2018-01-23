//
//  EvidenceBoxClass.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/20/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation

//Class that contains the entire evidence box
class EvidenceBox {
    var evidenceObjectsAR: [EvidenceBoxARObject] //Array of EvidenceObjectsAR objects
    
    init(evidenceObjectsAR: [EvidenceBoxARObject]) {
        self.evidenceObjectsAR = evidenceObjectsAR
    }
    
}
