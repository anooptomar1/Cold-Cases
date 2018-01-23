//
//  ResultsViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/10/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var currentCase: ColdCase!
    
    let notepadCoreDataFunctions = NotepadCoreDataFunctions()
    let caseUnlockedCoreDataFunctions = CaseUnlockedCoreDataFunctions()

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var returnToCaseButton: UIButton!
    @IBOutlet weak var returnHomeButton: UIButton!
    
    var caseStarted = UserDefaults.standard    
    var VC:UIViewController!
    var test = false
    
    
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentCase.caseSolveQuestions.guessArrays)
        print(currentCase.caseSolveQuestions.solutionArrays)

        //IF each guess array matches each case solve array the case has been solved. Otherwise the case has not been solved
        if (currentCase.caseSolveQuestions.guessArrays[0].compareArrays(as: currentCase.caseSolveQuestions.solutionArrays[0]) && currentCase.caseSolveQuestions.guessArrays[1].compareArrays(as: currentCase.caseSolveQuestions.solutionArrays[1]) && currentCase.caseSolveQuestions.guessArrays[2].compareArrays(as: currentCase.caseSolveQuestions.solutionArrays[2]) && currentCase.caseSolveQuestions.guessArrays[3].compareArrays(as: currentCase.caseSolveQuestions.solutionArrays[3]))
        {

            resultsLabel.text = "Excellent work! You have solved the case!"
            returnToCaseButton.isHidden = true
            //Reset Case started UserDefaults
            caseStarted.set(false, forKey: currentCase.caseName)
            caseStarted.synchronize()
            //clear notes from case
            notepadCoreDataFunctions.deleteCaseNotepad(caseNameSentIn: currentCase.caseName)
            //unlock next case
            if currentCase.caseIndex == 1 {
                print("case 2 unlocked")
                caseUnlockedCoreDataFunctions.storeCaseUnlocked(caseUnlockedBool: true, caseNameSentIn: "The Second Case")
            } else if currentCase.caseIndex == 2 {
                print("case 3 unlocked")
                caseUnlockedCoreDataFunctions.storeCaseUnlocked(caseUnlockedBool: true, caseNameSentIn: "The Third Case")
            }
            
            
        } else {
            resultsLabel.text = "FAILED"
            returnHomeButton.isHidden = true
        }
        
        
    }//END VIEWDIDLOAD
    

    //Return to case button available if the case was not solved
    @IBAction func returnToCase(_ sender: Any) {
        //clear guesses array
        currentCase.caseSolveQuestions.guessArrays = [[Int](),[Int](),[Int](),[Int]()]
        performSegue(withIdentifier: "unwindToOpenCaseFromResults", sender: self)
    }
    
    
    
    
    //return home button
    @IBAction func returnHome(_ sender: Any) {
        //clear guesses array
        currentCase.caseSolveQuestions.guessArrays = [[Int](),[Int](),[Int](),[Int]()]
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    

}


//function to check if 2 arrays contain the same elements
extension Array where Element: Comparable {
    func compareArrays(as otherArray: [Element]) -> Bool {
        print(self.count)
        print(otherArray.count)
            return self.count == otherArray.count && self.sorted() == otherArray.sorted()
    }
}

