//
//  SuspectsViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class SuspectsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    //Cold Case placeholder that is assigned at the segue from previous view
    var currentCase: ColdCase!
    //Suspects placeholder
    var suspectsArray: [Suspect]!
    var suspectToOpen: Suspect!
    
    @IBOutlet weak var suspectsCollectionView: UICollectionView!
    
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //Assigned suspects array to value passed in to currentCase from previous view
        suspectsArray = currentCase.suspect
        //Initializes collection view dataSource and delegate, and assigns them to this view controller class
        self.suspectsCollectionView.dataSource = self
        self.suspectsCollectionView.delegate = self
        

    }//END VIEWDIDLOAD
    
    
    
    //Initialize number of cells for collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suspectsArray.count
    }
    
    //CollectionView function that assigns values to the suspects in the collection view at each index point in the array.
    //Assigns suspect name to label and suspect image to UIImage
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "suspectView", for: indexPath) as! suspectViewCell
        cell.suspectName.text = self.suspectsArray[indexPath.row].name
        cell.suspectImage.image = UIImage(named: self.suspectsArray[indexPath.row].picture)
        return cell
    }
    
    //Function that manages selecting suspects
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentIndex = self.suspectsArray[indexPath.row]
        suspectToOpen = currentIndex
        performSegue(withIdentifier: "suspectsToSuspectDetail", sender: self)
    }
    
    
    

    
    //Notes button
    @IBAction func notesButton(_ sender: Any) {
        performSegue(withIdentifier: "suspectsToNotes", sender: self)
    }
    //Back button
    @IBAction func returnFromSuspectsToPreviousView(_ sender: Any) {
        performSegueToReturnBack()
    }
    
    //Segues to ensure that the data from the currentCase gets sent to the proper views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "suspectsToNotes" {
            let controller = segue.destination as! NotesViewController
            controller.currentCase = currentCase
        } else if segue.identifier == "suspectsToSuspectDetail" {
            let controller = segue.destination as! suspectDetailViewController
            controller.suspectDetails = suspectToOpen
            controller.currentCase = currentCase
        }
    }

}
