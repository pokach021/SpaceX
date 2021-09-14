//
//  RocketsViewController.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/8/21.
//

import UIKit

class RocketsViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var rocketData = [RocketModel]()
    
    
    lazy var collectionView: UICollectionView =  {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 360)
        flow.minimumLineSpacing = 30
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RocketCollectionViewCell.self, forCellWithReuseIdentifier: "RocketCell")
        collectionView.backgroundColor = .queenBlue
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .queenBlue
        collectionView.delegate = self
        collectionView.dataSource = self
        setupLayout()
        fetchData()
        if let navi = navigationController as? NavigationViewController {
            navi.configureViewControllerWithVectorButton(vc: self)
        }
    }
    
    func setupLayout() {
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
    func fetchData() {
        let jsonUrlString = "https://api.spacexdata.com/v4/rockets"
        weak var weakSelf = self
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let rockets = try JSONDecoder().decode([RocketModel].self, from: data)
                print(rockets)
                DispatchQueue.main.async {
                    if error != nil {
                        print("Fucking Error")
                    } else {
                        weakSelf?.rocketData = rockets
                        weakSelf?.collectionView.reloadData()
                    }
                }
                
            } catch let error {
                print("Fucking Error: \(error)")
            }
            
        }.resume()
        
    }
    
    
}
