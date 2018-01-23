//
//  performSegueToReturnBack.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/18/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
