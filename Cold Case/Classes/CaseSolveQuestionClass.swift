//
//  CaseSolveQuestionsClass.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/22/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation

class CaseSolveQuestions {
    var whoQuestions: [Suspect]
    var whatQuestions: [WhatQuestion]
    var whereQuestions: [WhereQuestion]
    var whyQuestions: [WhyQuestion]
    var solutionArrays: [[Int]]
    var guessArrays: [[Int]]
    
    init(whoQuestions: [Suspect], whatQuestions: [WhatQuestion], whereQuestions: [WhereQuestion], whyQuestions: [WhyQuestion], solutionArrays: [[Int]], guessArrays: [[Int]]) {
        self.whoQuestions = whoQuestions
        self.whatQuestions = whatQuestions
        self.whereQuestions = whereQuestions
        self.whyQuestions = whyQuestions
        self.solutionArrays = solutionArrays
        self.guessArrays = guessArrays
    }
}
