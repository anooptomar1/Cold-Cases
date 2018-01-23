//
//  WhoViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/10/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class WhoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //Cold Case placeholder that is assigned at the segue from previous view
    var currentCase: ColdCase!
    //Suspects placeholder
    var suspectsArray: [Suspect]!
    //Linked collectionView
    @IBOutlet weak var suspectsCollectionView: UICollectionView!
    //Question Index is used in assigning answers from this view to the proper guessesArray array
    var questionIndex = 0
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //Assigned suspects array to value passed in to currentCase from previous view
        suspectsArray = currentCase.caseSolveQuestions.whoQuestions
        
        //Initializes collection view dataSource and delegate, and assigns them to this view controller class
        self.suspectsCollectionView.dataSource = self
        self.suspectsCollectionView.delegate = self
    }//END VIEWDIDLOAD
    

    //Button that moves to the next question view
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "whoToWhere", sender: self)
    }
    
    //Notes button
    @IBAction func notesButton(_ sender: Any) {
        performSegue(withIdentifier: "whoToNotes", sender: self)
    }
    
    //Initialize number of cells for collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suspectsArray.count
    }
    
    //CollectionView function that assigns values to the suspects in the collection view at each index point in the array.
    //Assigns suspect name to label and suspect image to UIImage
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "suspect", for: indexPath) as! suspectCell
        cell.suspectName.text = self.suspectsArray[indexPath.row].name
        cell.suspectPicture.image = UIImage(named: self.suspectsArray[indexPath.row].picture)
        cell.backgroundImage.image = UIImage(named: "polaroid")
        return cell
    }
    
    //Function that manages selecting suspects
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let currentIndex = self.suspectsArray[indexPath.row]
        
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
    
    
    
    
    
    
    
    
    
    func scrollToNearestVisibleCollectionViewCell() {
        let visibleCenterPositionOfScrollView = Float(suspectsCollectionView.contentOffset.x + (self.suspectsCollectionView!.bounds.size.width / 2))
        var closestCellIndex = -1
        var closestDistance: Float = .greatestFiniteMagnitude

        for i in 0..<suspectsCollectionView.visibleCells.count {
            let cell = suspectsCollectionView.visibleCells[i]
            let cellWidth = cell.bounds.size.width
            let cellCenter = Float(cell.frame.origin.x + cellWidth / 2)
            
            // Now calculate closest cell
            let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
            if distance < closestDistance {
                closestDistance = distance
                closestCellIndex = suspectsCollectionView.indexPath(for: cell)!.row
            }
        }
        if closestCellIndex != -1 {
            self.suspectsCollectionView!.scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollToNearestVisibleCollectionViewCell()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            scrollToNearestVisibleCollectionViewCell()
        }
    }
    

    
    
    
    
    
    
    
    

    //Segues to ensure that the data from the currentCase gets sent to the proper views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "whoToWhere"{
            let controller = segue.destination as! WhereViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "whoToNotes"{
            let controller = segue.destination as! NotesViewController
            controller.currentCase = currentCase
        }
    }
}





