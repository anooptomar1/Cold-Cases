//
//  CaseSelectionViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class CaseSelectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var caseToSend: ColdCase?
    let case1 = coldCase1
    let case2 = coldCase2
    let case3 = coldCase3
    var casesToSend: [ColdCase]!
    var caseStarted = false
    var caseStartedDefault = UserDefaults.standard
    var notepadCoreDataFunctions = NotepadCoreDataFunctions()
    var caseUnlockedCoreDataFunctions = CaseUnlockedCoreDataFunctions()

    @IBOutlet weak var casesCollectionView: UICollectionView!
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        casesToSend = [case1, case2, case3]
        //Initializes collection view dataSource and delegate, and assigns them to this view controller class
        self.casesCollectionView.dataSource = self
        self.casesCollectionView.delegate = self

        

    }//END VIEWDIDLOAD
    
    
    
    
    
    //Initialize number of cells for collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return casesToSend.count
    }
    
    //CollectionView function that assigns a case to each case in the collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cases", for: indexPath) as! casesCell
        let currentIndex = self.casesToSend[indexPath.row]
        cell.caseName.text = currentIndex.caseName
        cell.caseImage.image = UIImage(named: "folderImage")
        
        return cell
    }
    
    //Function that manages selecting cases
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentIndex = self.casesToSend[indexPath.row]
        caseToSend = currentIndex
        var caseUnlocked = false
        
        //Always makees sure the first case is unlocked
        if currentIndex.caseIndex == 1{
            caseUnlocked = true
        } else {
            //CoreData functionality to check if case has been unlocked
            if let getCaseUnlocked = caseUnlockedCoreDataFunctions.getCaseUnlocked(caseNameSentIn: currentIndex.caseName) {
                if getCaseUnlocked == true {
                    caseUnlocked = true
                }
            }
        }

        
        
        if caseUnlocked == true {
            //UserDefaults to mark case as started or not started
            if caseStartedDefault.value(forKey: currentIndex.caseName) != nil {
                caseStarted = caseStartedDefault.bool(forKey: currentIndex.caseName) as Bool!
            }
            if caseStarted == true {
                print("true")
                performSegue(withIdentifier: "selectCaseToLoadOrNew", sender: self)
            } else {
                print("false")
                caseStartedDefault.set(true, forKey: currentIndex.caseName)
                caseStartedDefault.synchronize()
                notepadCoreDataFunctions.deleteCaseNotepad(caseNameSentIn: currentIndex.caseName)
                performSegue(withIdentifier: "selectCaseToIntro", sender: self)
            }
        }
        
        

    }
    
    
    
    
    //Unwind to this view
    @IBAction func unwindToCaseSelection(_ segue: UIStoryboardSegue) {
        
    }
    
    
    // Back button to return to previous view controller
    @IBAction func previousViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectCaseToLoadOrNew"{
            let controller = segue.destination as! LoadOrNewViewController
            controller.currentCase = caseToSend
        } else if segue.identifier == "selectCaseToIntro"{
            let controller = segue.destination as! IntroTextViewController
            controller.currentCase = caseToSend
        }
    }

}

