//
//  DetailRocketVC+CollectionViewCell.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/14/21.
//

import Foundation
import UIKit

extension DetailRocketViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailRocketCell", for: indexPath) as! DetailRocketCollectionViewCell
        let imageUrl = dataSource.flickr_images[indexPath.item]
        cell.configureWithItem(imageUrlStr: imageUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.flickr_images.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    
}
