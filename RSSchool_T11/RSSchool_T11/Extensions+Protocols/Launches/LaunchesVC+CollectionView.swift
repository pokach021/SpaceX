//
//  LaunchesVC+CollectionView.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/16/21.
//

import Foundation
import UIKit

extension LaunchesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LaunchCell", for: indexPath) as! LaunchesCollectionViewCell
        let launch = self.launchesData[indexPath.item]
        
        cell.configureWithItem(launch: launch)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        launchesData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailLaunchesViewController()
        vc.dataSource = self.launchesData[indexPath.item]
        let naviVC = UINavigationController(rootViewController: vc)
        naviVC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(naviVC, animated: true, completion: nil)
        
    }
    
}
