//
//  LoadOrNewViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/2/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit
import CoreData

class LoadOrNewViewController: UIViewController {
    var currentCase: ColdCase!
    let notepadCoreDataFunctions = NotepadCoreDataFunctions()
    
    
    

    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()

    }//END VIEWDIDLOAD
    
    
    //Button to load existing instance of selected case
    @IBAction func loadCaseButton(_ sender: Any) {
        //if intro text has not been shown load intro text
        //else load case selected
        performSegue(withIdentifier: "loadOrNewToOpenCase", sender: self)

    }
    
    //Button to start selected case new
    @IBAction func startNewCaseButton(_ sender: Any) {
        //clear notes from case
        notepadCoreDataFunctions.deleteCaseNotepad(caseNameSentIn: currentCase.caseName)
        //clear intro text flag from case
        //DO NOT CLEAR CASE SOLVE TIMER
        //DO NOT CLEAR HINTS USED PURCHASED FLAG FROM CASE
        performSegue(withIdentifier: "loadOrNewToIntroText", sender: self)
    }
    
    @IBAction func returnToPreviousViewButton(_ sender: Any) {
        performSegueToReturnBack()
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadOrNewToIntroText"{
            let controller = segue.destination as! IntroTextViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "loadOrNewToOpenCase"{
            let controller = segue.destination as! OpenCaseViewController
            controller.currentCase = currentCase
        }
    }

}
