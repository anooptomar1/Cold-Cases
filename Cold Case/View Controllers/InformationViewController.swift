//
//  InformationViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
    }//END VIEWDIDLOAD
    

    @IBAction func returnFromInformationToPreviousView(_ sender: Any) {
       performSegueToReturnBack()
    }


}
