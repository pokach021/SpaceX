//
//  AppDelegate.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootVC: UIViewController {
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.tintColor = .coral
        tabBarVC.tabBar.unselectedItemTintColor = .champagne
        tabBarVC.tabBar.barTintColor = .queenBlue
        let rocket = NavigationViewController(rootViewController: RocketsViewController())
        rocket.tabBarItem = UITabBarItem(title: "Rockets", image: UIImage(named: "rocket"), tag: 0)
        let launch = NavigationViewController(rootViewController: LaunchesViewController())
        launch.tabBarItem = UITabBarItem(title: "Launches", image: UIImage(named: "adjustment"), tag: 0)
        let launchpad = NavigationViewController(rootViewController: LaunchpadsViewController())
        launchpad.tabBarItem = UITabBarItem(title: "Launchpads", image: UIImage(named: "lego"), tag: 0)
        
        tabBarVC.customizableViewControllers = nil
        tabBarVC.viewControllers = [rocket, launch, launchpad]
        
        return tabBarVC
    }
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = rootVC
        //window.rootViewController = NavigationViewController(rootViewController: WebBrowserViewController())
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }

    

}

