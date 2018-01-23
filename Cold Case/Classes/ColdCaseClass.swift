//
//  ColdCaseClass.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/20/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation

//Class that contains each case
class ColdCase {
    let caseName: String
    let caseDifficulty: Int //1-3
    var caseUnlocked: Bool
    var casePurchased: Bool
    let evidenceBox: EvidenceBox //Evidence Box class containing evidence box objects
    let suspect: [Suspect] //Array of Suspects objects
    let caseDetails: CaseDetails //Case Details object
    let introText: String //Scrolling text at the start of a new case
    let caseSolveQuestions: CaseSolveQuestions
    let hints: [Hint]
    let caseIndex: Int

    init(caseName: String, caseDifficulty: Int, caseUnlocked: Bool, casePurchased: Bool, evidenceBox: EvidenceBox, suspect: [Suspect], caseDetails: CaseDetails, introText: String, caseSolveQuestions: CaseSolveQuestions, hints: [Hint], caseIndex: Int) {
        self.caseName = caseName
        self.caseDifficulty = caseDifficulty
        self.caseUnlocked = caseUnlocked
        self.casePurchased = casePurchased
        self.evidenceBox = evidenceBox
        self.suspect = suspect
        self.caseDetails = caseDetails
        self.introText = introText
        self.caseSolveQuestions = caseSolveQuestions
        self.hints = hints
        self.caseIndex = caseIndex
    }
}


