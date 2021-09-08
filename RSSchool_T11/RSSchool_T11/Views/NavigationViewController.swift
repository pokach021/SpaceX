//
//  NavigationViewController.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/8/21.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = .queenBlue
        self.navigationBar.tintColor = .coral
    }
    
    func configureViewControllerWithVectorButton(vc: UIViewController) {
        
       // let vectorButton = UIBarButtonItem(image: UIImage(named: "vector"), style: .plain, target: nil, action: nil)
        var vectorButton: UIButton {
            let vectorButton = UIButton()
            vectorButton.setImage(UIImage(named: "orange-vector"), for: .normal)
            
            return vectorButton
        }
        
        let vectorBarItem = UIBarButtonItem(customView: vectorButton)
        let currentWidth = vectorBarItem.customView?.widthAnchor.constraint(equalToConstant: 25)
        let currentHeight = vectorBarItem.customView?.heightAnchor.constraint(equalToConstant: 25)
        currentWidth?.isActive = true
        currentHeight?.isActive = true
        vc.navigationItem.rightBarButtonItem = vectorBarItem
        
    }
    
    func configureViewControllerWithSegmentControl(vc: UIViewController) {
        let segmentControl = UISegmentedControl(items: ["All", "Past", "Future"])
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.backgroundColor = .glaucous
        navigationBar.addSubview(segmentControl)
        NSLayoutConstraint.activate([
            segmentControl.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor),
            segmentControl.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor)
        ])
        
    }

   

}
