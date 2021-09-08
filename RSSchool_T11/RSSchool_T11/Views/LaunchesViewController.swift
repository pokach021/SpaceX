//
//  LaunchesViewController.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/8/21.
//

import UIKit

class LaunchesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .queenBlue
        
        if let navi = navigationController as? NavigationViewController {
            navi.configureViewControllerWithVectorButton(vc: self)
            navi.configureViewControllerWithSegmentControl(vc: self)
        }
    }
    

    

}
