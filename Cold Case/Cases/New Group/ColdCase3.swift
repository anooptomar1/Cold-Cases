//
//  ColdCase3.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/19/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation


var coldCase3 = ColdCase(caseName: caseName3, caseDifficulty: 1, caseUnlocked: true, casePurchased: true, evidenceBox: evidenceBoxcase3, suspect: suspectsArray3, caseDetails: ColdCase3CaseDetails, introText: "The first day of the rest of your life", caseSolveQuestions: coldCase3Questions, hints: hintsArray3, caseIndex: 3)



//CASE NAME
//Initialize the case name
var caseName3 = "The Third Case"


//EVIDENCE BOX
//Create the evidence box AR objects
var evidenceBoxObject1case3 = EvidenceBoxARObject(objectDescription: "Object1", objectName: "chair")
var evidenceBoxObject2case3 = EvidenceBoxARObject(objectDescription: "Object2", objectName: "lamp")
var evidenceBoxObject3case3 = EvidenceBoxARObject(objectDescription: "Object3", objectName: "vase")
var evidenceBoxObject4case3 = EvidenceBoxARObject(objectDescription: "Object4", objectName: "cup")

//Create an array of evidence box ar objects
var evidenceBoxArray3 = [evidenceBoxObject1case3, evidenceBoxObject2case3, evidenceBoxObject3case3, evidenceBoxObject4case3]

//Saves evidence box array into evidence box
var evidenceBoxcase3 = EvidenceBox(evidenceObjectsAR: evidenceBoxArray3)


//SUSPECT
//Create suspect objects
var suspect9 = Suspect(name: "Brad Cupp", age: "24", height: "6'2", hairColor: "Brown", race: "White", unusualFeatures: "Tall", picture: "penImage", questionId: 601, details: "placeholder details")
var suspect10 = Suspect(name: "Grace Cupp", age: "24", height: "5'2", hairColor: "Brown", race: "White", unusualFeatures: "Short. Beautiful", picture: "phoneImage", questionId: 602, details: "placeholder details")
var suspect11 = Suspect(name: "Brad Cupp", age: "24", height: "6'2", hairColor: "Brown", race: "White", unusualFeatures: "Tall", picture: "penImage", questionId: 603, details: "placeholder details")
var suspect12 = Suspect(name: "Grace Cupp", age: "24", height: "5'2", hairColor: "Brown", race: "White", unusualFeatures: "Short. Beautiful", picture: "phoneImage", questionId: 604, details: "placeholder details")
var suspect13 = Suspect(name: "Brad Cupp", age: "24", height: "6'2", hairColor: "Brown", race: "White", unusualFeatures: "Tall", picture: "penImage", questionId: 605, details: "placeholder details")
var suspect14 = Suspect(name: "Grace Cupp", age: "24", height: "5'2", hairColor: "Brown", race: "White", unusualFeatures: "Short. Beautiful", picture: "phoneImage", questionId: 606, details: "placeholder details")

//Create array of suspect objects
var suspectsArray3 = [suspect9, suspect10, suspect11, suspect12, suspect13, suspect14]


//CASE DETAILS
//Create case details
var ColdCase3CaseDetails = CaseDetails(caseName: caseName1, caseSummary: "This is a murder case. Everything is crazy!", soundEffects: true)



//CASE SOLVE QUESTIONS
//Create where questions
var case3WhereQuestion1 = WhereQuestion(whereQuestion: "The Boat", questionId: 701)
var case3WhereQuestion2 = WhereQuestion(whereQuestion: "The Library", questionId: 702)
var case3WhereQuestion3 = WhereQuestion(whereQuestion: "The Bathroom", questionId: 703)
var case3WhereQuestion4 = WhereQuestion(whereQuestion: "The Bedroom", questionId: 704)

//Create an array of where questions
var case3WhereQuestions = [case3WhereQuestion1, case3WhereQuestion2, case3WhereQuestion3, case3WhereQuestion4]

//Create what questions
var case3WhatQuestion1 = WhatQuestion(whatQuestionImageName: "deskLamp", whatQuestionLabel:"Chair", questionId: 801)
var case3WhatQuestion2 = WhatQuestion(whatQuestionImageName: "penImage", whatQuestionLabel:"Lamp", questionId: 802)
var case3WhatQuestion3 = WhatQuestion(whatQuestionImageName: "phoneImage", whatQuestionLabel:"Vase", questionId: 803)
var case3WhatQuestion4 = WhatQuestion(whatQuestionImageName: "folderImage", whatQuestionLabel:"Cup", questionId: 804)

//Create and array of what questions
var case3WhatQuestions = [case3WhatQuestion1, case3WhatQuestion2, case3WhatQuestion3, case3WhatQuestion4]

//Create why questions
var case3WhyQuestion1 = WhyQuestion(whyQuestion: "The Money", questionId: 901)
var case3WhyQuestion2 = WhyQuestion(whyQuestion: "The Love", questionId: 902)
var case3WhyQuestion3 = WhyQuestion(whyQuestion: "The Greed", questionId: 903)
var case3WhyQuestion4 = WhyQuestion(whyQuestion: "The Stupidity", questionId: 904)

//Create an array of why questions
var case3WhyQuestions = [case3WhyQuestion1, case3WhyQuestion2, case3WhyQuestion3, case3WhyQuestion4]

//Create an array of answers for the questions
var case3SolveAnswers = [[601,602],[701],[801],[901]]

//Create an empty array for answer guesses
var case3Guesses = [[Int](),[Int](),[Int](),[Int]()]

//Combine all questions into single object
var coldCase3Questions = CaseSolveQuestions(whoQuestions: suspectsArray3, whatQuestions: case3WhatQuestions, whereQuestions: case3WhereQuestions, whyQuestions: case3WhyQuestions, solutionArrays: case3SolveAnswers, guessArrays: case3Guesses)



//HINTS
//Create hints
var hintcase3 = Hint(hint: "Look under the candlestick")

//Create an array of hints
var hintsArray3 = [hintcase3]






