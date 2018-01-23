//
//  NotepadCoreDataFunctions.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/1/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class NotepadCoreDataFunctions {

    //CORE DATA CODE FOR SAVING/FETCHING/MODIFYING/DELETING NOTEPADS

    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }


    //Function to save Notepad into CoreData
    func storeNote (noteText: String, caseNameSentIn: String) {
        let context = getContext()
        
        //retrieve the Notepad entity and assign it to the notepad variable
        let entity = NSEntityDescription.entity(forEntityName: "NotepadCD", in: context)
        let notepad = NSManagedObject(entity: entity!, insertInto: context)
        
        //set notepad values
        notepad.setValue(noteText, forKey: "noteText")
        notepad.setValue(caseNameSentIn, forKey: "caseName")
        
        //Save the notepad object
        do {
            try context.save()
            print("Saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }



    //function to retrieve Notepad data from CoreData
    func getNotepad(caseNameSentIn: String) -> String? {
        var notepadTextToReturn: String?
        //creating fetch request telling it what entity(Notepad) it is fetching
        let fetchRequest: NSFetchRequest<NotepadCD> = NotepadCD.fetchRequest()
        
        do {
            //go get the array of Notepad objects
            let notepadArray = try getContext().fetch(fetchRequest)
            print("Number of Notepads: \(notepadArray.count)")
            
            //cycle through the array of Notepad objects
            for notepad in notepadArray as [NSManagedObject] {
                var notepadText = String()
                var caseName = String()
                if let notepadTextTemp = notepad.value(forKey: "noteText"){notepadText = notepadTextTemp as! String}
                if let caseNameTemp = notepad.value(forKey: "caseName"){caseName = caseNameTemp as! String}
                
                if (caseName == caseNameSentIn)
                {
                    notepadTextToReturn = notepadText
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
        //            print(notepadTextToReturn + "Text to return")
        return notepadTextToReturn
    }



    //function to update Notepad data in CoreData
    func updateNotepad(noteText: String, caseNameSentIn: String) {
        let context = getContext()
        let fetchRequest: NSFetchRequest<NotepadCD> = NotepadCD.fetchRequest()
        
        do {
            let notepadArray = try getContext().fetch(fetchRequest)
            
            for notepad in notepadArray as [NSManagedObject] {
                var caseName = String()
                if let caseNameTemp = notepad.value(forKey: "caseName"){caseName = caseNameTemp as! String}
                
                if (caseName == caseNameSentIn)
                {
                    notepad.setValue(noteText, forKey: "noteText")
                    do {
                        try context.save()
                        print("saved!")
                    } catch let error as NSError  {
                        print("Could not save \(error), \(error.userInfo)")
                    } catch {
                        
                    }
                }
            }
            
        } catch {
            print("Error with request: \(error)")
        }
    }


    //function to delete Notepad data from CoreData
    func deleteCaseNotepad(caseNameSentIn: String) {
        
        let context = getContext()
        
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<NotepadCD> = NotepadCD.fetchRequest()
        
        do {
            //go get the results
            let notepadArray = try getContext().fetch(fetchRequest)
            
            //You need to convert to NSManagedObject to use 'for' loops
            for notepad in notepadArray as [NSManagedObject] {
                var caseName = String()
                if let caseNameTemp = notepad.value(forKey: "caseName"){caseName = caseNameTemp as! String}
                
                if (caseName == caseNameSentIn)
                {
                    context.delete(notepad)
                    do {
                        try context.save()
                        print("saved!")
                    } catch let error as NSError  {
                        print("Could not save \(error), \(error.userInfo)")
                    } catch {
                       //error
                    }
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
    }



    //function to delete all Notepad data from CoreData
    func deleteAllNotepads() {
        
        let context = getContext()
        
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<NotepadCD> = NotepadCD.fetchRequest()
        
        do {
            //go get the results
            let notepadArray = try getContext().fetch(fetchRequest)
            
            //You need to convert to NSManagedObject to use 'for' loops
            for notepad in notepadArray as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                context.delete(notepad)
            }
            //save the context
            
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
        } catch {
            print("Error with request: \(error)")
        }
    }
    // END COREDATA

}
