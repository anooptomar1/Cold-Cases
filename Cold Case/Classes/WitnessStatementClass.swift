//
//  WitnessStatementClass.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/20/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation

//Class to hold witness statements
class WitnessStatement {
    let witnessName: String
    let statement: String
    
    init(witnessName: String, statement: String) {
        self.witnessName = witnessName
        self.statement = statement
    }
}
