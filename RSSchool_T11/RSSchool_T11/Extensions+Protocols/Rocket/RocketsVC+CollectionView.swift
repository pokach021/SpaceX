//
//  RocketsVC+CollectionView.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/9/21.
//

import Foundation
import UIKit

extension RocketsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RocketCell", for: indexPath) as! RocketCollectionViewCell
        let rocket = self.rocketData[indexPath.item]
        cell.configureWithItem(rocket: rocket)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rocketData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailRocketViewController()
        vc.dataSource = rocketData[indexPath.item]
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vc, animated: true, completion: nil)
        
    }
    
}
