//
//  WhatQuestionClass.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/11/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation

class WhatQuestion {
    var whatQuestionImageName: String
    var whatQuestionLabel: String
    var questionId: Int
    
    init(whatQuestionImageName: String, whatQuestionLabel: String, questionId: Int) {
        self.whatQuestionImageName = whatQuestionImageName
        self.whatQuestionLabel = whatQuestionLabel
        self.questionId = questionId
    }
}
