//
//  DetailLaunches+CollectionView.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/16/21.
//

import Foundation
import UIKit

extension DetailLaunchesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailLaunchCell", for: indexPath) as! DetailRocketCollectionViewCell
        let imageUrl = dataSource.links.flickr.original[indexPath.item]
        cell.configureWithItem(imageUrlStr: imageUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.links.flickr.original.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    
}
