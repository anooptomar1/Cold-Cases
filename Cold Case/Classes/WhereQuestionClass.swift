//
//  WhereQuestionClass.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/11/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation

class WhereQuestion {
    var whereQuestion: String
    var questionId: Int
    
    init(whereQuestion: String, questionId: Int) {
        self.whereQuestion = whereQuestion
        self.questionId = questionId
    }
}
