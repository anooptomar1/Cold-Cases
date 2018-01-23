//
//  WhatViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/10/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class WhatViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var currentCase: ColdCase!
    var questionIndex = 2
        //Suspects placeholder
    var evidenceArray: [WhatQuestion]!
        //linked collectionView
    @IBOutlet weak var evidencePicturesCollectionView: UICollectionView!
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //Assigned suspects array to value passed in to currentCase from previous view
        evidenceArray = currentCase.caseSolveQuestions.whatQuestions
        
        //Initializes collection view dataSource and delegate, and assigns them to this view controller class
        self.evidencePicturesCollectionView.dataSource = self
        self.evidencePicturesCollectionView.delegate = self
        
    }//END VIEWDIDLOAD
    
    
    //next button
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "whatToWhy", sender: self)
    }
    //notes button
    @IBAction func notesButton(_ sender: Any) {
        performSegue(withIdentifier: "whatToNotes", sender: self)
    }
    
    
    //Initialize number of cells for collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return evidenceArray.count
    }
    
    //CollectionView function that assigns values to the suspects in the collection view at each index point in the array.
    //Assigns suspect name to label and suspect image to UIImage
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "evidence", for: indexPath) as! evidenceCell
        cell.evidenceNameLabel.text = self.evidenceArray[indexPath.row].whatQuestionLabel
        cell.evidenceImage.image = UIImage(named: self.evidenceArray[indexPath.row].whatQuestionImageName)
        return cell
    }
    
    //Function that manages selecting suspects
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let currentIndex = self.evidenceArray[indexPath.row]
        
        // if the suspect has not been selected change the background color to green
        // and add suspect questionId to the guessArrays array associated with the questionIndex
        if cell?.backgroundColor != UIColor.green {
            cell?.backgroundColor = UIColor.green
            currentCase.caseSolveQuestions.guessArrays[questionIndex].append(currentIndex.questionId)
            
            // if the suspect has already been suspected change the background color to the original color
            // and remove the suspect questionId from the guessArrays array associated with the questionIndex
        } else {
            cell?.backgroundColor = UIColor.brown
            if let index = currentCase.caseSolveQuestions.guessArrays[questionIndex].index(of: currentIndex.questionId) {
                currentCase.caseSolveQuestions.guessArrays[questionIndex].remove(at: index)
            }
        }
    }
    
    
    //Segues to ensure that the data from the currentCase gets sent to the proper views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "whatToWhy"{
            let controller = segue.destination as! WhyViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "whatToNotes"{
            let controller = segue.destination as! NotesViewController
            controller.currentCase = currentCase
        }
    }
}
