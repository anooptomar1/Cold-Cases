//
//  suspectDetailViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/13/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class suspectDetailViewController: UIViewController {
    var currentCase: ColdCase!
    var suspectDetails: Suspect!

    //Outlets for all the labels
    @IBOutlet weak var suspectImage: UIImageView!
    @IBOutlet weak var suspectName: UILabel!
    @IBOutlet weak var suspectAge: UILabel!
    @IBOutlet weak var suspectHairColor: UILabel!
    @IBOutlet weak var suspectHeight: UILabel!
    @IBOutlet weak var suspectFeatures: UILabel!
    @IBOutlet weak var suspectInformation: UILabel!
    
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialize all the labels on view to suspect information
        suspectImage.image = UIImage(named: suspectDetails.picture)
        suspectName.text = suspectDetails.name
        suspectAge.text = suspectDetails.age
        suspectHairColor.text = suspectDetails.hairColor
        suspectHeight.text = suspectDetails.height
        suspectFeatures.text = suspectDetails.unusualFeatures
        suspectInformation.text = suspectDetails.details

    }//END VIEWDIDLOAD


    //Back button
    @IBAction func backButton(_ sender: Any) {
        performSegueToReturnBack()
    }
    //Notes button
    @IBAction func notesButton(_ sender: Any) {
        performSegue(withIdentifier: "suspectDetailsToNotes", sender: self)
    }
    
    //Segues to ensure that the data from the currentCase gets sent to the proper views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "suspectDetailsToNotes" {
            let controller = segue.destination as! NotesViewController
            controller.currentCase = currentCase
        }
    }

}
