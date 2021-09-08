//
//  LaunchpadsViewController.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/8/21.
//

import UIKit

class LaunchpadsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .queenBlue
       
        if let navi = navigationController as? NavigationViewController {
            navi.configureViewControllerWithVectorButton(vc: self)
            navi.configureViewControllerWithSegmentControl(vc: self)
        }
    }
    

    
}
