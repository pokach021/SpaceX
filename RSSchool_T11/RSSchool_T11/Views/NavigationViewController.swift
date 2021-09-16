//
//  NavigationViewController.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/8/21.
//

import UIKit
import WebKit

class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = .queenBlue
        self.navigationBar.tintColor = .coral
        self.toolbar.barTintColor = .queenBlue
    }
    
    func configureViewControllerWithVectorButton(vc: UIViewController) {
        let vectorButton: UIButton = {
            let vectorButton = UIButton()
            vectorButton.setImage(UIImage(named: "orange-vector"), for: .normal)
            
            return vectorButton
        }()
        
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
    
    func configureWBNavigation(vc: UIViewController, targetToUpdate: WKWebView) {
       
        let backButton: UIButton = {
            let backButton = UIButton()
            backButton.setImage(UIImage(named: "button-back"), for: .normal)
            
            return backButton
        }()
        
        let nextButton: UIButton = {
            let nextButton = UIButton()
            nextButton.setImage(UIImage(named: "button-next"), for: .normal)
            
            return nextButton
        }()
        
        let shareButton: UIButton = {
            let shareButton = UIButton()
            shareButton.setImage(UIImage(named: "share"), for: .normal)
            
            return shareButton
        }()
        
        let safariButton: UIButton = {
            let safariButton = UIButton()
            safariButton.setImage(UIImage(named: "safari"), for: .normal)
            
            return safariButton
        }()
        
        let previousButtonItem = UIBarButtonItem(customView: backButton)
        let nextButtonItem = UIBarButtonItem(customView: nextButton)
        let shareButtonItem = UIBarButtonItem(customView: shareButton)
        let safariButtonItem = UIBarButtonItem(customView: safariButton)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refreshButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: targetToUpdate, action: #selector(targetToUpdate.reload))
        let backButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismisSelf(_:)))
        vc.navigationItem.rightBarButtonItem = refreshButtonItem
        vc.navigationItem.leftBarButtonItem = backButtonItem
        vc.toolbarItems = [previousButtonItem, spacer, nextButtonItem, spacer, shareButtonItem, spacer, safariButtonItem]
        vc.navigationController?.isToolbarHidden = false
        
    }
    
    @objc func dismisSelf(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
