//
//  DeskPhoneViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 11/10/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class DeskPhoneViewController: UIViewController {
    var currentCase: ColdCase!

    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }//END VIEWDIDLOAD

    //Button to start case solving questions
    @IBAction func callItInButton(_ sender: Any) {
        performSegue(withIdentifier: "deskPhoneToWho", sender: self)
    }
    
    //Return to previous view controller
    @IBAction func notReadyButton(_ sender: Any) {
        performSegueToReturnBack()
    }
    
    //Segues to ensure that the data from the currentCase gets sent to the proper views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "deskPhoneToWho"{
            let controller = segue.destination as! WhoViewController
            controller.currentCase = currentCase
        }
    }
}
