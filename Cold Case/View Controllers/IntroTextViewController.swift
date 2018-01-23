//
//  IntroTextViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class IntroTextViewController: UIViewController {
    // Placeholder variable for ColdCase object with all the details for eaach case.
    // This value gets set in the segue when the case is selected from the case selection view
    var currentCase: ColdCase!
    @IBOutlet weak var introText: UILabel!
    @IBOutlet weak var caseTitle: UILabel!
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        introText.text = currentCase.introText
        caseTitle.text = currentCase.caseName

    }//END VIEWDIDLOAD
    
    
    //Continue button
    @IBAction func continueToCase(_ sender: Any) {
        performSegue(withIdentifier: "introToCaseSelected", sender: self)
    }

    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindFromIntroToCaseSelection", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "introToCaseSelected"{
            let controller = segue.destination as! OpenCaseViewController
            controller.currentCase = currentCase
        }
    }


}
