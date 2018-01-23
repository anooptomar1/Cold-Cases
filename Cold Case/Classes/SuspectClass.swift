//
//  SuspectsClass.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/20/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation

class Suspect {
    var name: String
    var age: String
    var height: String
    var hairColor: String
    var race: String //Make enum?
    var unusualFeatures: String  //For descriptions that include unusual features like a scar etc...
    var picture: String
    var questionId: Int
    var details: String
    
    init(name: String, age: String, height: String, hairColor: String, race: String, unusualFeatures: String, picture: String, questionId: Int, details: String) {
        self.name = name
        self.age = age
        self.height = height
        self.hairColor = hairColor
        self.race = race
        self.unusualFeatures = unusualFeatures
        self.picture = picture
        self.questionId = questionId
        self.details = details
    }
}
