//
//  OpenCaseMenuViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 12/11/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class OpenCaseMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButton(_ sender: Any) {
        performSegueToReturnBack()
    }
    
    @IBAction func helpButton(_ sender: Any) {
        //TODO
        //Check previous view to determine whether to open the openCaseHelp or evidenceBoxHelp
    }
    
    
    
    @IBAction func homeButton(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
}
