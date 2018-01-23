//
//  CaseUnlockedCoreDataFunctions.swift
//  Cold Case
//
//  Created by Bradley Cupp on 12/17/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CaseUnlockedCoreDataFunctions {
    
    //CORE DATA CODE FOR CHECKING TO SEE IF A CASE IS UNLOCKED
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    //Function to save CaseUnlocked into CoreData
    func storeCaseUnlocked(caseUnlockedBool: Bool, caseNameSentIn: String) {
        let context = getContext()
        
        //retrieve the CaseUnlocked entity and assign it to the caseUnlocked variable
        let entity = NSEntityDescription.entity(forEntityName: "CaseUnlockedCD", in: context)
        let caseUnlocked = NSManagedObject(entity: entity!, insertInto: context)
        
        //set CaseUnlocked values
        caseUnlocked.setValue(caseUnlockedBool, forKey: "caseUnlocked")
        caseUnlocked.setValue(caseNameSentIn, forKey: "caseName")
        
        //Save the CaseUnlocked object
        do {
            try context.save()
            print("Saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    
    
    //function to retrieve CaseUnlocked data from CoreData
    func getCaseUnlocked(caseNameSentIn: String) -> Bool? {
        var caseUnlockedBoolToReturn: Bool?
        //creating fetch request telling it what entity(CaseUnlocked) it is fetching
        let fetchRequest: NSFetchRequest<CaseUnlockedCD> = CaseUnlockedCD.fetchRequest()
        
        do {
            //go get the array of CaseUnlocked objects
            let caseUnlockedArray = try getContext().fetch(fetchRequest)
            print("Number of CaseUnlocked Objects: \(caseUnlockedArray.count)")
            
            //cycle through the array of CaseUnlocked objects
            for caseUnlocked in caseUnlockedArray as [NSManagedObject] {
                var caseUnlockedBool = Bool()
                var caseName = String()
                if let caseUnlockedBoolTemp = caseUnlocked.value(forKey: "caseUnlocked"){caseUnlockedBool = caseUnlockedBoolTemp as! Bool}
                if let caseNameTemp = caseUnlocked.value(forKey: "caseName"){caseName = caseNameTemp as! String}
                
                if (caseName == caseNameSentIn)
                {
                    caseUnlockedBoolToReturn = caseUnlockedBool
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
        return caseUnlockedBoolToReturn
    }
    
    
    
    //function to update CaseUnlocked data in CoreData
    func updateCaseUnlocked(caseUnlockedBool: Bool, caseNameSentIn: String) {
        let context = getContext()
        let fetchRequest: NSFetchRequest<CaseUnlockedCD> = CaseUnlockedCD.fetchRequest()
        
        do {
            let caseUnlockedArray = try getContext().fetch(fetchRequest)
            
            for caseUnlocked in caseUnlockedArray as [NSManagedObject] {
                var caseName = String()
                if let caseNameTemp = caseUnlocked.value(forKey: "caseName"){caseName = caseNameTemp as! String}
                
                if (caseName == caseNameSentIn)
                {
                    caseUnlocked.setValue(caseUnlockedBool, forKey: "caseUnlockedBool")
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
    
    
    //function to delete CaseUnlocked data from CoreData
    func deleteCaseUnlocked(caseNameSentIn: String) {
        
        let context = getContext()
        
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<CaseUnlockedCD> = CaseUnlockedCD.fetchRequest()
        
        do {
            //go get the results
            let caseUnlockedArray = try getContext().fetch(fetchRequest)
            
            //You need to convert to NSManagedObject to use 'for' loops
            for caseUnlocked in caseUnlockedArray as [NSManagedObject] {
                var caseName = String()
                if let caseNameTemp = caseUnlocked.value(forKey: "caseName"){caseName = caseNameTemp as! String}
                
                if (caseName == caseNameSentIn)
                {
                    context.delete(caseUnlocked)
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
    
    
    
    //function to delete all CaseUnlocked data from CoreData
    func deleteAllCaseUnlocked() {
        
        let context = getContext()
        
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<CaseUnlockedCD> = CaseUnlockedCD.fetchRequest()
        
        do {
            //go get the results
            let caseUnlockedArray = try getContext().fetch(fetchRequest)
            
            //You need to convert to NSManagedObject to use 'for' loops
            for caseUnlocked in caseUnlockedArray as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                context.delete(caseUnlocked)
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
