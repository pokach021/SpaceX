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
    
    lazy var mainLabel: CustomLabel = {
        let mainLabel = CustomLabel(labelColor: .white, labelFontSize: 48)
        mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.text = dataSource.name
        return mainLabel
    }()
    
    lazy var mainImageView: UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.backgroundColor = .black
        
        let url = URL(string: dataSource.flickr_images.last!)
        let session = URLSession.shared
        
        session.dataTask(with: url!) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    mainImageView.image = image
                }
            }
        }.resume()
        
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
    
    lazy var overviewStackView = DetailStackView(description: ["First Launch",
                                                               "Launch cost",
                                                               "Succes",
                                                               "Mass",
                                                               "Height",
                                                               "Diameter"],
                                                 descriptionFromWeb: [dataSource.first_flight,
                                                                      "\(dataSource.cost_per_launch)$",
                                                                      "\(dataSource.success_rate_pct)%",
                                                                      "\(dataSource.mass.kg) kg",
                                                                      "\(dataSource.height.meters) meters",
                                                                      "\(dataSource.diameter.meters) meters"])
    
    lazy var imagesLabel: CustomLabel = {
        let imagesLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        imagesLabel.text = "Images"
        return imagesLabel
    }()
    
    lazy var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width - 275, height: 200)
        flow.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        flow.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DetailRocketCollectionViewCell.self, forCellWithReuseIdentifier: "DetailRocketCell")
        return collectionView
    }()
    
    lazy var enginesLabel: CustomLabel = {
        let enginesLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        enginesLabel.text = "Engines"
        return enginesLabel
    }()
    
    lazy var enginesStackView = DetailStackView(description: ["Type",
                                                              "Layout",
                                                              "Version",
                                                              "Amount",
                                                              "Propellant 1",
                                                              "Propellant 2"],
                                                descriptionFromWeb: [dataSource.engines.type,
                                                                     dataSource.engines.layout ?? "NO",
                                                                     dataSource.engines.version,
                                                                     "\(dataSource.engines.number)",
                                                                     dataSource.engines.propellant_1,
                                                                     dataSource.engines.propellant_2])
    
    lazy var firstStageLabel: CustomLabel = {
        let firstStageLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        firstStageLabel.text = "First Stage"
        return firstStageLabel
    }()
    
    lazy var firstStageStackView = DetailStackView(description: ["Reusable",
                                                                 "Engines amount",
                                                                 "Fuel amount",
                                                                 "Burning time",
                                                                 "Thrust (sea level)",
                                                                 "Thrust (vacuum)"],
                                                   descriptionFromWeb: [dataSource.first_stage.reusable ? "Yes" : "No" ,
                                                                        "\(dataSource.first_stage.engines)",
                                                                        "\(dataSource.first_stage.fuel_amount_tons) tons",
                                                                        "\(dataSource.first_stage.burn_time_sec ?? 0) seconds",
                                                                        "\(dataSource.first_stage.thrust_sea_level.kN) kN",
                                                                        "\(dataSource.first_stage.thrust_vacuum.kN) kN"])
    
    lazy var secondtStageLabel: CustomLabel = {
        let secondtStageLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        secondtStageLabel.text = "Second Stage"
        return secondtStageLabel
    }()
    
    lazy var secondStageStackView = DetailStackView(description: ["Reusable",
                                                                  "Engines amount",
                                                                  "Fuel amount",
                                                                  "Burning time",
                                                                  "Thrust"],
                                                    descriptionFromWeb: [dataSource.second_stage.reusable ? "Yes" : "No" ,
                                                                         "\(dataSource.second_stage.engines)",
                                                                         "\(dataSource.second_stage.fuel_amount_tons) tons",
                                                                         "\(dataSource.second_stage.burn_time_sec ?? 0) seconds",
                                                                         "\(dataSource.second_stage.thrust.kN) kN"])
    
    lazy var landingLegsLabel: CustomLabel = {
        let landingLegsLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        landingLegsLabel.text = "Landing Legs"
        return landingLegsLabel
    }()
    
    lazy var landingLegsStackView = DetailStackView(description: ["Amount",
                                                                  "Material"],
                                                    descriptionFromWeb: ["\(dataSource.landing_legs.number)",
                                                                         dataSource.landing_legs.material ?? "Unknown"])
    
    lazy var materialsLabel: CustomLabel = {
        let materialsLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        materialsLabel.text = "Materials"
        return materialsLabel
    }()
    
    lazy var wikiButton = WBButton(title: "Wikipedia")
    
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
        mainImageView.addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 295),
            mainLabel.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: -100),
            mainLabel.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 0)
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
            collectionView.heightAnchor.constraint(equalToConstant: 210)
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
        scrollView.addSubview(firstStageLabel)
        NSLayoutConstraint.activate([
            firstStageLabel.leadingAnchor.constraint(equalTo: overviewLabel.leadingAnchor),
            firstStageLabel.trailingAnchor.constraint(equalTo: overviewLabel.trailingAnchor),
            firstStageLabel.topAnchor.constraint(equalTo: enginesStackView.bottomAnchor, constant: 30),
            firstStageLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(firstStageStackView)
        NSLayoutConstraint.activate([
            firstStageStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            firstStageStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -130),
            firstStageStackView.topAnchor.constraint(equalTo: firstStageLabel.bottomAnchor, constant: 20),
            firstStageStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -490),
        ])
        scrollView.addSubview(secondtStageLabel)
        NSLayoutConstraint.activate([
            secondtStageLabel.leadingAnchor.constraint(equalTo: overviewLabel.leadingAnchor),
            secondtStageLabel.trailingAnchor.constraint(equalTo: overviewLabel.trailingAnchor),
            secondtStageLabel.topAnchor.constraint(equalTo: firstStageStackView.bottomAnchor, constant: 30),
            secondtStageLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(secondStageStackView)
        NSLayoutConstraint.activate([
            secondStageStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            secondStageStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -130),
            secondStageStackView.topAnchor.constraint(equalTo: secondtStageLabel.bottomAnchor, constant: 20),
            secondStageStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -275),
        ])
        scrollView.addSubview(landingLegsLabel)
        NSLayoutConstraint.activate([
            landingLegsLabel.leadingAnchor.constraint(equalTo: overviewLabel.leadingAnchor),
            landingLegsLabel.trailingAnchor.constraint(equalTo: overviewLabel.trailingAnchor),
            landingLegsLabel.topAnchor.constraint(equalTo: secondStageStackView.bottomAnchor, constant: 30),
            landingLegsLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(landingLegsStackView)
        NSLayoutConstraint.activate([
            landingLegsStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            landingLegsStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -130),
            landingLegsStackView.topAnchor.constraint(equalTo: landingLegsLabel.bottomAnchor, constant: 20),
            landingLegsStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -150),
        ])
        scrollView.addSubview(materialsLabel)
        NSLayoutConstraint.activate([
            materialsLabel.leadingAnchor.constraint(equalTo: overviewLabel.leadingAnchor),
            materialsLabel.trailingAnchor.constraint(equalTo: overviewLabel.trailingAnchor),
            materialsLabel.topAnchor.constraint(equalTo: landingLegsStackView.bottomAnchor, constant: 30),
            materialsLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(wikiButton)
        wikiButton.addTarget(self, action: #selector(openWB), for: .touchUpInside)
        NSLayoutConstraint.activate([
            wikiButton.topAnchor.constraint(equalTo: materialsLabel.bottomAnchor, constant: 20),
            wikiButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            wikiButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -275),
            wikiButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40)
        ])
    }

    @objc func dismisSelf() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func openWB() {
        let vc = WebBrowserViewController()
        vc.websites.append(dataSource.wikipedia)
        let naviVC = NavigationViewController(rootViewController: vc)
        naviVC.modalPresentationStyle = .fullScreen
        self.present(naviVC, animated: true, completion: nil)
    }
}
