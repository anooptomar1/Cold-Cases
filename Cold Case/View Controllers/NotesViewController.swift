//
//  NotesViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {
    @IBOutlet weak var notes: UITextView!
    var currentCase: ColdCase!
    //Initialize NotepadCoreDataFunctions() within view
    let notepadCoreDataFunctions = NotepadCoreDataFunctions()
    
    //VIEWDIDLOAD/Users/bradleycupp/Library/Mobile Documents/com~apple~CloudDocs/Files/Business/DoublVision/Cold Case/Code/Cold Case/Cold Case/View Controllers/NotesViewController.swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Checks to see if notepad exists for current case
        //If notepad does not exist creates new note
        if let getNotepad = notepadCoreDataFunctions.getNotepad(caseNameSentIn: currentCase.caseName) {
            print(getNotepad)
            notes.text = getNotepad
        } else {
            notepadCoreDataFunctions.storeNote(noteText: "", caseNameSentIn: currentCase.caseName)
        }
        
    } //END VIEWDIDLOAD
    
    //Return to previous view and updates CoreData with whatever text is in the notepad
    @IBAction func returnFromNotesToPreviousView(_ sender: Any) {
        performSegueToReturnBack()
    }

    //Function to save notes on view close
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notepadCoreDataFunctions.updateNotepad(noteText: notes.text, caseNameSentIn: currentCase.caseName)
    }

}

