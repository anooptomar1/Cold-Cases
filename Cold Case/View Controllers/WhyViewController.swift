//
//  WhyViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/10/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class WhyViewController: UIViewController {
    var currentCase: ColdCase!
    var questionIndex = 3
    
    //Linked question button outlets
    @IBOutlet weak var question1: UIButton!
    @IBOutlet weak var question2: UIButton!
    @IBOutlet weak var question3: UIButton!
    @IBOutlet weak var question4: UIButton!
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //Question button text changed to question text
        question1.setTitle(currentCase.caseSolveQuestions.whyQuestions[0].whyQuestion, for: .normal)
        question2.setTitle(currentCase.caseSolveQuestions.whyQuestions[1].whyQuestion, for: .normal)
        question3.setTitle(currentCase.caseSolveQuestions.whyQuestions[2].whyQuestion, for: .normal)
        question4.setTitle(currentCase.caseSolveQuestions.whyQuestions[3].whyQuestion, for: .normal)
        
    }//END VIEWDIDLOAD
    
    
    //Button click functions for each of the questions
    @IBAction func question1Button(_ sender: Any) {
        buttonSelected(button: question1, questionLabelIndex: 0, questionId: currentCase.caseSolveQuestions.whyQuestions[0].questionId)
    }
    @IBAction func question2Button(_ sender: Any) {
        buttonSelected(button: question2, questionLabelIndex: 1, questionId: currentCase.caseSolveQuestions.whyQuestions[1].questionId)
    }
    @IBAction func question3Button(_ sender: Any) {
        buttonSelected(button: question3, questionLabelIndex: 2, questionId: currentCase.caseSolveQuestions.whyQuestions[2].questionId)
    }
    @IBAction func question4Button(_ sender: Any) {
        buttonSelected(button: question4, questionLabelIndex: 3, questionId: currentCase.caseSolveQuestions.whyQuestions[3].questionId)
    }
    
    
    //Solve Button
    @IBAction func solveButton(_ sender: Any) {
        performSegue(withIdentifier: "whyToResults", sender: self)
    }
    //Notes button
    @IBAction func notesButton(_ sender: Any) {
        performSegue(withIdentifier: "whyToNotes", sender: self)
    }
    
    
    //function that turn button green on selection or brown on deselection
    //function also adds button questionId to guessArray
    func buttonSelected(button: UIButton, questionLabelIndex: Int, questionId: Int) {
        if button.backgroundColor != UIColor.green {
            button.backgroundColor = UIColor.green
            currentCase.caseSolveQuestions.guessArrays[questionIndex].append(currentCase.caseSolveQuestions.whyQuestions[questionLabelIndex].questionId)
        } else {
            button.backgroundColor = UIColor.brown
            if let index = currentCase.caseSolveQuestions.guessArrays[questionIndex].index(of: currentCase.caseSolveQuestions.whereQuestions[questionLabelIndex].questionId) {
                currentCase.caseSolveQuestions.guessArrays[questionIndex].remove(at: index)
            }
        }
    }
    
    //Segues to ensure that the data from the currentCase gets sent to the proper views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "whyToResults"{
            let controller = segue.destination as! ResultsViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "whyToNotes"{
            let controller = segue.destination as! NotesViewController
            controller.currentCase = currentCase
        }
    }
}
