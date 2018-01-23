//
//  OpenCaseViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class OpenCaseViewController: UIViewController {
    //Sets case name text to case name
    @IBOutlet weak var caseName: UILabel!
    // Placeholder variable for ColdCase object with all the details for eaach case.
    // This value gets set in the segue when the case is selected from the case selection view
    var currentCase: ColdCase!
    
    var firstTimeCaseOpened: Bool!
    var firstTimeCaseOpenedDefault = UserDefaults.standard
    

    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set case name based off of the case selected
        caseName.text = currentCase.caseName
        
        //UserDefaults to mark case as started or not started
        if firstTimeCaseOpenedDefault.value(forKey: "firstTimeOpened") == nil {
            firstTimeCaseOpened = firstTimeCaseOpenedDefault.bool(forKey: "firstTimeOpened") as Bool!
        }
        

    }//END VIEWDIDLOAD
    
    override func viewDidAppear(_ animated: Bool) {
        if firstTimeCaseOpened == false && currentCase.caseIndex == 1 {
            firstTimeCaseOpenedDefault.set(true, forKey: "firstTimeOpened")
            firstTimeCaseOpened = true
            performSegue(withIdentifier: "openCaseToOpenCaseHelp", sender: self)
        }
    }
    
    
    //Button to go to Evidence Box
    @IBAction func evidenceBoxButton(_ sender: Any) {
        performSegue(withIdentifier: "openCaseToEvidenceBox", sender: self)
    }
    //Button to go to suspects
    @IBAction func suspectsButton(_ sender: Any) {
        performSegue(withIdentifier: "openCaseToSuspects", sender: self)
    }
    //Button to go to phone
    @IBAction func phoneButton(_ sender: Any) {
        performSegue(withIdentifier: "openCaseToDeskPhone", sender: self)
    }
    
    @IBAction func menuButton(_ sender: Any) {
        performSegue(withIdentifier: "openCaseToOpenCaseMenu", sender: self)
    }
    
    
    //Unwind target
    @IBAction func unwindToOpenCase(_ segue: UIStoryboardSegue) {
    
    }
    
    //Segues to ensure that the data from the currentCase gets sent to the proper views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openCaseToCaseDetails"{
            let controller = segue.destination as! CaseDetailsViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "openCaseToNotepad"{
            let controller = segue.destination as! NotesViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "openCaseToSuspects" {
            let controller = segue.destination as! SuspectsViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "openCaseToEvidenceBox" {
            let controller = segue.destination as! EvidenceBoxViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "openCaseToHints" {
            let controller = segue.destination as! HintsViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "openCaseToDeskPhone" {
            let controller = segue.destination as! DeskPhoneViewController
            controller.currentCase = currentCase
        }
    }

}
