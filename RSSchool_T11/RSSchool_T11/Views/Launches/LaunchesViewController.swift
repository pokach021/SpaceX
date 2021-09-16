//
//  LaunchesViewController.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/8/21.
//

import UIKit

class LaunchesViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var launchesData = [LaunchesModel]()
    
    
    lazy var collectionView: UICollectionView =  {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 145)
        flow.minimumLineSpacing = 30
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LaunchesCollectionViewCell.self, forCellWithReuseIdentifier: "LaunchCell")
        collectionView.backgroundColor = .queenBlue
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .queenBlue
        setupLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchData()
        
        if let navi = navigationController as? NavigationViewController {
            navi.configureViewControllerWithVectorButton(vc: self)
            navi.configureViewControllerWithSegmentControl(vc: self)
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
        
        let jsonUrlString = "https://api.spacexdata.com/v5/launches"
        weak var weakSelf = self
        guard let url = URL(string: jsonUrlString) else { return }
        
        let decoder = JSONDecoder()
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        dateFormatter.locale = Locale(identifier: "en_BY")
//        dateFormatter.timeZone = TimeZone(identifier: "America/Los_Angeles")
//        
//        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let session = URLSession.shared
            session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let launches = try decoder.decode([LaunchesModel].self, from: data)
                DispatchQueue.main.async {
                    if error != nil {
                        print("Fucking Error")
                    } else {
                        weakSelf?.launchesData = launches
                        weakSelf?.collectionView.reloadData()
                        print(self.launchesData)
                    }
                }
                
            } catch let error {
                print("Fucking Error: \(error)")
            }
            
        }.resume()
        
    }
    

    

}
