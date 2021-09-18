//
//  DetailLaunchesViewController.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/16/21.
//

import UIKit

class DetailLaunchesViewController: UIViewController, UIScrollViewDelegate {

    var dataSource: LaunchesModel!
    let downloader = Downloader()
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var mainLabel: CustomLabel = {
        let mainLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        mainLabel.text = dataSource.name
        return mainLabel
    }()
    
    lazy var dateLabel: CustomLabel = {
        let dateLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 17)
        dateLabel.font = UIFont(name: "Roboto-Medium", size: 17)
        dateLabel.text = dataSource.date_utc
        return dateLabel
    }()
    
    lazy var patchLabel: UILabel = {
        let patchLabel = UILabel()
        patchLabel.translatesAutoresizingMaskIntoConstraints = false
        patchLabel.layer.cornerRadius = 20
        patchLabel.backgroundColor = .white

        return patchLabel
    }()
    
    lazy var patchLabelImageView: UIImageView = {
        let patchLabelImageView = UIImageView()
        patchLabelImageView.translatesAutoresizingMaskIntoConstraints = false
        patchLabelImageView.clipsToBounds = false
        patchLabelImageView.backgroundColor = .white
        
        let session = URLSession.shared

        let url = URL(string: dataSource.links.patch.small ?? "https://images2.imgbox.com/53/22/dh0XSLXO_o.png")

        session.dataTask(with: url!) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        patchLabelImageView.image = image
                    }
                }
            }.resume()
        
        return patchLabelImageView
    }()
    
    lazy var processLabel: UILabel = {
        let processLabel = UILabel()
        processLabel.translatesAutoresizingMaskIntoConstraints = false
        processLabel.backgroundColor = .white
        processLabel.clipsToBounds = true
        processLabel.layer.cornerRadius = 16
        
        return processLabel
    }()
    
    lazy var numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.textColor = .cyanProcess
        numberLabel.font = UIFont(name: "Roboto-Medium", size: 17)
        numberLabel.textAlignment = .center
        numberLabel.backgroundColor = .white
        numberLabel.layer.cornerRadius = 15
        numberLabel.text = "#\(dataSource.flight_number)"
        return numberLabel
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
    
    lazy var overviewStackView = DetailStackView(description: ["Static fire date",
                                                               "Launch date",
                                                               "Succes"],
                                                 descriptionFromWeb: [dataSource.static_fire_date_utc ?? "Unknown",
                                                                      dataSource.date_utc,
                                                                      (dataSource.success ?? false) ? "Yes" : "No",])
    
    lazy var imagesLabel: CustomLabel = {
        let imagesLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        imagesLabel.text = "Images"
        return imagesLabel
    }()
    
    lazy var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width - 275, height: 200)
        flow.sectionInset = UIEdgeInsets(top: 78, left: 20, bottom: 0, right: 20)
        flow.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DetailRocketCollectionViewCell.self, forCellWithReuseIdentifier: "DetailLaunchCell")
        return collectionView
    }()
    
    lazy var rocketLabel: CustomLabel = {
        let rocketLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
        rocketLabel.text = "Rocket"
        return rocketLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .queenBlue
        descriptionText.text = dataSource.details ?? ""
        setupLayout()
    }
    
    func setupLayout() {
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        scrollView.addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            mainLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200),
            mainLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 15),
            dateLabel.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -230),
            dateLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        scrollView.addSubview(patchLabel)
        NSLayoutConstraint.activate([
            patchLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor),
            patchLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            patchLabel.heightAnchor.constraint(equalTo: patchLabel.widthAnchor),
            patchLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 280)
        ])
        patchLabel.addSubview(patchLabelImageView)
        NSLayoutConstraint.activate([
            patchLabelImageView.topAnchor.constraint(equalTo: patchLabel.topAnchor, constant: 15),
            patchLabelImageView.bottomAnchor.constraint(equalTo: patchLabel.bottomAnchor, constant: -15),
            patchLabelImageView.leadingAnchor.constraint(equalTo: patchLabel.leadingAnchor, constant: 9),
            patchLabelImageView.trailingAnchor.constraint(equalTo: patchLabel.trailingAnchor, constant: -9)
        ])
        scrollView.addSubview(processLabel)
        NSLayoutConstraint.activate([
            processLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            processLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            processLabel.heightAnchor.constraint(equalToConstant: 32),
            processLabel.widthAnchor.constraint(equalTo: processLabel.heightAnchor)
        ])
        scrollView.addSubview(numberLabel)
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            numberLabel.leadingAnchor.constraint(equalTo: processLabel.trailingAnchor, constant: 10),
            numberLabel.trailingAnchor.constraint(equalTo: patchLabel.leadingAnchor, constant: -100),
            numberLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        scrollView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(descriptionText)
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            descriptionText.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            descriptionText.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//            descriptionText.heightAnchor.constraint(equalToConstant: 120)
        ])
        scrollView.addSubview(overviewLabel)
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 30),
            overviewLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            overviewLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        scrollView.addSubview(overviewStackView)
        NSLayoutConstraint.activate([
            overviewStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            overviewStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -150),
            overviewStackView.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 20),
            overviewStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -1270),
        ])
        scrollView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: overviewStackView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
        if dataSource.links.flickr.original.isEmpty {
            collectionView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        } else {
            collectionView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        }
        collectionView.addSubview(imagesLabel)
        NSLayoutConstraint.activate([
            imagesLabel.leadingAnchor.constraint(equalTo: overviewLabel.leadingAnchor),
            imagesLabel.trailingAnchor.constraint(equalTo: overviewLabel.trailingAnchor),
            imagesLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 30),
            imagesLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        scrollView.addSubview(rocketLabel)
        NSLayoutConstraint.activate([
            rocketLabel.leadingAnchor.constraint(equalTo: overviewLabel.leadingAnchor),
            rocketLabel.trailingAnchor.constraint(equalTo: overviewLabel.trailingAnchor),
            rocketLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            rocketLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    

}
