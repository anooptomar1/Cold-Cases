//
//  ColdCase2.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/21/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation


var coldCase2 = ColdCase(caseName: caseName2, caseDifficulty: 1, caseUnlocked: true, casePurchased: true, evidenceBox: evidenceBoxCase2, suspect: suspectsArray2, caseDetails: ColdCase2CaseDetails, introText: "The last day of the rest of your life", caseSolveQuestions: coldcase2Questions, hints: hintsArray2, caseIndex: 2)



//CASE NAME
//Initialize the case name
var caseName2 = "The Second Case"


//EVIDENCE BOX
//Create the evidence box AR objects
var evidenceBoxObject1Case2 = EvidenceBoxARObject(objectDescription: "Object1", objectName: "table")
var evidenceBoxObject2Case2 = EvidenceBoxARObject(objectDescription: "Object2", objectName: "lamp")
var evidenceBoxObject3Case2 = EvidenceBoxARObject(objectDescription: "Object3", objectName: "vase")
var evidenceBoxObject4Case2 = EvidenceBoxARObject(objectDescription: "Object4", objectName: "candle")

//Create an array of evidence box ar objects
var evidenceBoxArray2 = [evidenceBoxObject1Case2, evidenceBoxObject2Case2, evidenceBoxObject3Case2, evidenceBoxObject4Case2]

//Saves evidence box array into evidence box
var evidenceBoxCase2 = EvidenceBox(evidenceObjectsAR: evidenceBoxArray2)


//SUSPECT
//Create suspect objects
var suspect3 = Suspect(name: "Brad Cupp", age: "24", height: "6'2", hairColor: "Brown", race: "White", unusualFeatures: "Gorgeous", picture: "Placeholder", questionId: 601, details: "placeholder details")
var suspect4 = Suspect(name: "Grace Cupp", age: "24", height: "5'2", hairColor: "Brown", race: "White", unusualFeatures: "Short. Beautiful", picture: "Placeholder", questionId: 602, details: "placeholder details")
var suspect15 = Suspect(name: "Brad Cupp", age: "24", height: "6'2", hairColor: "Brown", race: "White", unusualFeatures: "Gorgeous", picture: "Placeholder", questionId: 601, details: "placeholder details")
var suspect16 = Suspect(name: "Grace Cupp", age: "24", height: "5'2", hairColor: "Brown", race: "White", unusualFeatures: "Short. Beautiful", picture: "Placeholder", questionId: 602, details: "placeholder details")

//Create array of suspect objects
var suspectsArray2 = [suspect3, suspect4, suspect15, suspect16]


//CASE DETAILS
//Create case details
var ColdCase2CaseDetails = CaseDetails(caseName: caseName2, caseSummary: "This is a BURGLARY case. Everything is crazy!", soundEffects: true)



//CASE SOLVE QUESTIONS
//Create where questions
var case2WhereQuestion1 = WhereQuestion(whereQuestion: "The Boat", questionId: 701)
var case2WhereQuestion2 = WhereQuestion(whereQuestion: "The Library", questionId: 702)
var case2WhereQuestion3 = WhereQuestion(whereQuestion: "The Bathroom", questionId: 703)
var case2WhereQuestion4 = WhereQuestion(whereQuestion: "The Bedroom", questionId: 704)

//Create an array of where questions
var case2WhereQuestions = [case2WhereQuestion1, case2WhereQuestion2, case2WhereQuestion3, case2WhereQuestion4]

//Create what questions
var case2WhatQuestion1 = WhatQuestion(whatQuestionImageName: "folderImage", whatQuestionLabel:"Chair", questionId: 801)
var case2WhatQuestion2 = WhatQuestion(whatQuestionImageName: "deskLamp", whatQuestionLabel:"Lamp", questionId: 802)
var case2WhatQuestion3 = WhatQuestion(whatQuestionImageName: "penImage", whatQuestionLabel:"Vase", questionId: 803)
var case2WhatQuestion4 = WhatQuestion(whatQuestionImageName: "deskLamp", whatQuestionLabel:"Cup", questionId: 804)

//Create and array of what questions
var case2WhatQuestions = [case2WhatQuestion1, case2WhatQuestion2, case2WhatQuestion3, case2WhatQuestion4]

//Create why questions
var case2WhyQuestion1 = WhyQuestion(whyQuestion: "The Money", questionId: 901)
var case2WhyQuestion2 = WhyQuestion(whyQuestion: "The Love", questionId: 902)
var case2WhyQuestion3 = WhyQuestion(whyQuestion: "The Greed", questionId: 903)
var case2WhyQuestion4 = WhyQuestion(whyQuestion: "The Stupidity", questionId: 904)

//Create an array of why questions
var case2WhyQuestions = [case2WhyQuestion1, case2WhyQuestion2, case2WhyQuestion3, case2WhyQuestion4]

//Create an array of answers for the questions
var case2SolveAnswers = [[601,602],[701],[801],[901]]

//Create an empty array for answer guesses
var case2Guesses = [[Int](),[Int](),[Int](),[Int]()]

//Combine all questions into single object
var coldcase2Questions = CaseSolveQuestions(whoQuestions: suspectsArray1, whatQuestions: case2WhatQuestions, whereQuestions: case2WhereQuestions, whyQuestions: case2WhyQuestions, solutionArrays: case2SolveAnswers, guessArrays: case2Guesses)



//HINTS
//Create hints
var hintCase2 = Hint(hint: "Look under the candlestick")

//Create an array of hints
var hintsArray2 = [hintCase2]





