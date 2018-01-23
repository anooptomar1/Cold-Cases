//
//  HomeViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
    }//END VIEWDIDLOAD
    
    
    @IBAction func returnFromSettingsToPreviousView(_ sender: Any) {
        performSegueToReturnBack()
    }
    
    //Functionality to return to the home screen(Root view controller)
    @IBAction func returnToHome(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }



}


