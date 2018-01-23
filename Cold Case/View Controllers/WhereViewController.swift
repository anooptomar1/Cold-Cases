//
//  WhereViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/10/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class WhereViewController: UIViewController {
    var currentCase: ColdCase!
    var questionIndex = 1

    //Linked question button outlets
    @IBOutlet weak var question1: UIButton!
    @IBOutlet weak var question2: UIButton!
    @IBOutlet weak var question3: UIButton!
    @IBOutlet weak var question4: UIButton!
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //Question button text changed to question text
        question1.setTitle(currentCase.caseSolveQuestions.whereQuestions[0].whereQuestion, for: .normal)
        question2.setTitle(currentCase.caseSolveQuestions.whereQuestions[1].whereQuestion, for: .normal)
        question3.setTitle(currentCase.caseSolveQuestions.whereQuestions[2].whereQuestion, for: .normal)
        question4.setTitle(currentCase.caseSolveQuestions.whereQuestions[3].whereQuestion, for: .normal)
    }//END VIEWDIDLOAD
    

    //Button click functions for each of the questions
    @IBAction func question1Button(_ sender: Any) {
        buttonSelected(button: question1, questionLabelIndex: 0, questionId: currentCase.caseSolveQuestions.whereQuestions[0].questionId)
    }
    @IBAction func question2Button(_ sender: Any) {
        buttonSelected(button: question2, questionLabelIndex: 1, questionId: currentCase.caseSolveQuestions.whereQuestions[1].questionId)
    }
    @IBAction func question3Button(_ sender: Any) {
        buttonSelected(button: question3, questionLabelIndex: 2, questionId: currentCase.caseSolveQuestions.whereQuestions[2].questionId)
    }
    @IBAction func question4Button(_ sender: Any) {
        buttonSelected(button: question4, questionLabelIndex: 3, questionId: currentCase.caseSolveQuestions.whereQuestions[3].questionId)
    }
    
        //Next button function
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "whereToWhat", sender: self)
    }
    
    //Notes Button function
    @IBAction func notesButton(_ sender: Any) {
        performSegue(withIdentifier: "whereToNotes", sender: self)
    }
    
    
    //function that turn button green on selection or brown on deselection
    //function also adds button questionId to guessArray and removes it if deselected
    func buttonSelected(button: UIButton, questionLabelIndex: Int, questionId: Int) {
        if button.backgroundColor != UIColor.green {
            button.backgroundColor = UIColor.green
            currentCase.caseSolveQuestions.guessArrays[questionIndex].append(currentCase.caseSolveQuestions.whereQuestions[questionLabelIndex].questionId)
        } else {
            button.backgroundColor = UIColor.brown
            if let index = currentCase.caseSolveQuestions.guessArrays[questionIndex].index(of: currentCase.caseSolveQuestions.whereQuestions[questionLabelIndex].questionId) {
                currentCase.caseSolveQuestions.guessArrays[questionIndex].remove(at: index)
            }
        }
    }
    
    
    //Segues to ensure that the data from the currentCase gets sent to the proper views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "whereToWhat"{
            let controller = segue.destination as! WhatViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "whereToNotes"{
            let controller = segue.destination as! NotesViewController
            controller.currentCase = currentCase
        }
    }
}
