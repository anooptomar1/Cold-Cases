//
//  ColdCase1.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/20/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation


var coldCase1 = ColdCase(caseName: caseName1, caseDifficulty: 1, caseUnlocked: true, casePurchased: true, evidenceBox: evidenceBoxCase1, suspect: suspectsArray1, caseDetails: ColdCase1CaseDetails, introText: "The first day of the rest of your life", caseSolveQuestions: coldCase1Questions, hints: hintsArray1, caseIndex: 1)



//CASE NAME
//Initialize the case name
var caseName1 = "The First Case"


//EVIDENCE BOX
//Create the evidence box AR objects
var evidenceBoxObject1Case1 = EvidenceBoxARObject(objectDescription: "Object1", objectName: "chair")
var evidenceBoxObject2Case1 = EvidenceBoxARObject(objectDescription: "Object2", objectName: "lamp")
var evidenceBoxObject3Case1 = EvidenceBoxARObject(objectDescription: "Object3", objectName: "vase")
var evidenceBoxObject4Case1 = EvidenceBoxARObject(objectDescription: "Object4", objectName: "cup")

//Create an array of evidence box ar objects
var evidenceBoxArray1 = [evidenceBoxObject1Case1, evidenceBoxObject2Case1, evidenceBoxObject3Case1, evidenceBoxObject4Case1]

//Saves evidence box array into evidence box
var evidenceBoxCase1 = EvidenceBox(evidenceObjectsAR: evidenceBoxArray1)


//SUSPECT
//Create suspect objects
var suspect1 = Suspect(name: "Brad Cupp", age: "24", height: "6'2", hairColor: "Brown", race: "White", unusualFeatures: "Tall", picture: "eric", questionId: 601, details: "placeholder details")
var suspect2 = Suspect(name: "Grace Cupp", age: "24", height: "5'2", hairColor: "Brown", race: "White", unusualFeatures: "Short. Beautiful", picture: "eric", questionId: 602, details: "placeholder details")
var suspect7 = Suspect(name: "Brad Cupp", age: "24", height: "6'2", hairColor: "Brown", race: "White", unusualFeatures: "Tall", picture: "eric", questionId: 603, details: "placeholder details")
var suspect8 = Suspect(name: "Grace Cupp", age: "24", height: "5'2", hairColor: "Brown", race: "White", unusualFeatures: "Short. Beautiful", picture: "eric", questionId: 604, details: "placeholder details")
var suspect5 = Suspect(name: "Brad Cupp", age: "24", height: "6'2", hairColor: "Brown", race: "White", unusualFeatures: "Tall", picture: "eric", questionId: 605, details: "placeholder details")
var suspect6 = Suspect(name: "Grace Cupp", age: "24", height: "5'2", hairColor: "Brown", race: "White", unusualFeatures: "Short. Beautiful", picture: "eric", questionId: 606, details: "placeholder details")

//Create array of suspect objects
var suspectsArray1 = [suspect1, suspect2, suspect7, suspect8, suspect5, suspect6]


//CASE DETAILS
//Create case details
var ColdCase1CaseDetails = CaseDetails(caseName: caseName1, caseSummary: "This is a murder case. Everything is crazy!", soundEffects: true)



//CASE SOLVE QUESTIONS
//Create where questions
var case1WhereQuestion1 = WhereQuestion(whereQuestion: "The Boat", questionId: 701)
var case1WhereQuestion2 = WhereQuestion(whereQuestion: "The Library", questionId: 702)
var case1WhereQuestion3 = WhereQuestion(whereQuestion: "The Bathroom", questionId: 703)
var case1WhereQuestion4 = WhereQuestion(whereQuestion: "The Bedroom", questionId: 704)

//Create an array of where questions
var case1WhereQuestions = [case1WhereQuestion1, case1WhereQuestion2, case1WhereQuestion3, case1WhereQuestion4]

//Create what questions
var case1WhatQuestion1 = WhatQuestion(whatQuestionImageName: "deskLamp", whatQuestionLabel:"Chair", questionId: 801)
var case1WhatQuestion2 = WhatQuestion(whatQuestionImageName: "penImage", whatQuestionLabel:"Lamp", questionId: 802)
var case1WhatQuestion3 = WhatQuestion(whatQuestionImageName: "phoneImage", whatQuestionLabel:"Vase", questionId: 803)
var case1WhatQuestion4 = WhatQuestion(whatQuestionImageName: "folderImage", whatQuestionLabel:"Cup", questionId: 804)

//Create and array of what questions
var case1WhatQuestions = [case1WhatQuestion1, case1WhatQuestion2, case1WhatQuestion3, case1WhatQuestion4]

//Create why questions
var case1WhyQuestion1 = WhyQuestion(whyQuestion: "The Money2", questionId: 901)
var case1WhyQuestion2 = WhyQuestion(whyQuestion: "The Love", questionId: 902)
var case1WhyQuestion3 = WhyQuestion(whyQuestion: "The Greed", questionId: 903)
var case1WhyQuestion4 = WhyQuestion(whyQuestion: "The Stupidity", questionId: 904)

//Create an array of why questions
var case1WhyQuestions = [case1WhyQuestion1, case1WhyQuestion2, case1WhyQuestion3, case1WhyQuestion4]

//Create an array of answers for the questions
var case1SolveAnswers = [[601,602],[701],[801],[901]]

//Create an empty array for answer guesses
var case1Guesses = [[Int](),[Int](),[Int](),[Int]()]

//Combine all questions into single object
var coldCase1Questions = CaseSolveQuestions(whoQuestions: suspectsArray1, whatQuestions: case1WhatQuestions, whereQuestions: case1WhereQuestions, whyQuestions: case1WhyQuestions, solutionArrays: case1SolveAnswers, guessArrays: case1Guesses)



//HINTS
//Create hints
var hintCase1 = Hint(hint: "Look under the candlestick")

//Create an array of hints
var hintsArray1 = [hintCase1]





