//
//  HintsViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit

class HintsViewController: UIViewController {
    var currentCase: ColdCase!

    @IBOutlet weak var hint1Temp: UILabel!
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }//END VIEWDIDLOAD
    
    @IBAction func returnFromHintsToPreviousView(_ sender: Any) {
        performSegueToReturnBack()
    }
    
}
