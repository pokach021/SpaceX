//
//  DetailRocketViewController.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/14/21.
//

import UIKit

class DetailRocketViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout {
    var dataSource: RocketModel!
    
    lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "button-back"), for: .normal)
        backButton.addTarget(self, action: #selector(dismisSelf), for: .touchUpInside)
        return backButton
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var mainImageView: UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.backgroundColor = .black
        return mainImageView
    }()
    
    lazy var descriptionLabel: CustomLabel = {
        let descriptionLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        descriptionLabel.text = "Description"
        return descriptionLabel
    }()
    
    lazy var descriptionText = CustomTextView(frame: .zero, textContainer: nil)
    
    lazy var overviewLabel: CustomLabel = {
        let overviewLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        overviewLabel.text = "Overview"
        return overviewLabel
    }()
    
    lazy var overviewStackView = DetailStackView(description: ["First Launch", "Launch cost", "Succes", "Mass", "Height", "Diameter"], descriptionFromWeb: [dataSource.first_flight, "\(dataSource.cost_per_launch)$", "\(dataSource.success_rate_pct)%", "1234kg", "\(dataSource.height.meters) meters", "\(dataSource.diameter.meters) meters"])
    
    lazy var imagesLabel: CustomLabel = {
        let imagesLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        imagesLabel.text = "Images"
        return imagesLabel
    }()
    
    lazy var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width - 120, height: 200)
        flow.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        flow.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DetailRocketCollectionViewCell.self, forCellWithReuseIdentifier: "DetailRocketCell")
        return collectionView
    }()
    
    lazy var enginesLabel: CustomLabel = {
        let enginesLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        enginesLabel.text = "First Stage"
        return enginesLabel
    }()
    
    lazy var enginesStackView = DetailStackView(description: ["Type", "Layout", "Version", "Amount", "Propellant 1", "Propellant 2"], descriptionFromWeb: [dataSource.engines.type, dataSource.engines.layout ?? "NO", dataSource.engines.version, "\(dataSource.engines.number)", dataSource.engines.propellant_1, dataSource.engines.propellant_2])
    
//    lazy var firstStageStackView = DetailStackView(description: ["Reusable", "Engines amount", "Fuel amount", "Burning time", "Thrust (sea level)", "Thrust (vacuum)"], descriptionFromWeb: ["","","",""," kN",""])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.isHidden = true
        descriptionText.text = dataSource.description
        setupLayout()
    }
    
    
    func setupLayout() {
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        scrollView.addSubview(mainImageView)
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 380)
        ])
        scrollView.addSubview(backButton)
        scrollView.bringSubviewToFront(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 50),
            backButton.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 25)
        ])
        scrollView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 420),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(descriptionText)
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            descriptionText.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            descriptionText.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            descriptionText.heightAnchor.constraint(equalToConstant: 120)
        ])
        scrollView.addSubview(overviewLabel)
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 30),
            overviewLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200),
            overviewLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(overviewStackView)
        NSLayoutConstraint.activate([
            overviewStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            overviewStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -150),
            overviewStackView.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 20),
            overviewStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -1270),
        ])
        scrollView.addSubview(imagesLabel)
        NSLayoutConstraint.activate([
            imagesLabel.leadingAnchor.constraint(equalTo: overviewLabel.leadingAnchor),
            imagesLabel.trailingAnchor.constraint(equalTo: overviewLabel.trailingAnchor),
            imagesLabel.topAnchor.constraint(equalTo: overviewStackView.bottomAnchor, constant: 30),
            imagesLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: imagesLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
        scrollView.addSubview(enginesLabel)
        NSLayoutConstraint.activate([
            enginesLabel.leadingAnchor.constraint(equalTo: overviewLabel.leadingAnchor),
            enginesLabel.trailingAnchor.constraint(equalTo: overviewLabel.trailingAnchor),
            enginesLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            enginesLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(enginesStackView)
        NSLayoutConstraint.activate([
            enginesStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            enginesStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -130),
            enginesStackView.topAnchor.constraint(equalTo: enginesLabel.bottomAnchor, constant: 20),
            enginesStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -740),
        ])
        
    }

    @objc func dismisSelf() {
        self.dismiss(animated: true, completion: nil)
    }

}
