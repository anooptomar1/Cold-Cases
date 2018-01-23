//
//  CaseDetailsViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class CaseDetailsViewController: UIViewController {
    @IBOutlet weak var caseTitle: UILabel!
    @IBOutlet weak var caseDetails: UILabel!
    var currentCase: ColdCase!
    
    //STARTVIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        caseDetails.text = currentCase.caseDetails.caseSummary
        caseTitle.text = currentCase.caseName

    }//END VIEWDIDLOAD
    
    
    //Notes button
    @IBAction func notesButton(_ sender: Any) {
        performSegue(withIdentifier: "caseDetailsToNotes", sender: self)
    }
    //Calls function to close the Case Details modal and return to view that called Case Details
    @IBAction func returnFromCaseDetailsToPreviousView(_ sender: Any) {
        performSegueToReturnBack()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "caseDetailsToNotes"{
            let controller = segue.destination as! NotesViewController
            controller.currentCase = currentCase
        }
    }

}
