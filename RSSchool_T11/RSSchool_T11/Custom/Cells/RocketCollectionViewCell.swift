//
//  RocketCollectionViewCell.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/9/21.
//

import UIKit

class RocketCollectionViewCell: UICollectionViewCell {
    
    lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.font = UIFont(name: "Roboto-Bold", size: 24)
        mainLabel.textColor = .smookyBlack
        mainLabel.text = "Falcon Heavy"
        return mainLabel
    }()
    
    lazy var firstLaunchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        label.textColor = .smookyBlack
        label.text = "First Launch"
        return label
    }()
    
    lazy var launchDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        label.textColor = .slateGray
        label.text = "Februaury 6, 2018"
        return label
    }()
    
    lazy var launchCostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        label.textColor = .smookyBlack
        label.text = "Launch cost"
        return label
    }()
    
    lazy var costLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        label.textColor = .slateGray
        label.text = "90000000$"
        return label
    }()
    
    lazy var successLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        label.textColor = .smookyBlack
        label.text = "Success"
        return label
    }()
    
    lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        label.textColor = .slateGray
        label.text = "100%"
        return label
    }()
    
    lazy var mainIamgeView: UIImageView = {
        let mainIamgeView = UIImageView()
        mainIamgeView.translatesAutoresizingMaskIntoConstraints = false
        mainIamgeView.clipsToBounds = true
        mainIamgeView.contentMode = .scaleAspectFill
        mainIamgeView.backgroundColor = .black
        mainIamgeView.layer.cornerRadius = 10
        return mainIamgeView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupLayout()
    }
    
    func setupCell() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
    }
    //MARK: Change to stackview labels
    /// Adding constraints to subviews
    func setupLayout() {
        self.addSubview(mainIamgeView)
        NSLayoutConstraint.activate([
            mainIamgeView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mainIamgeView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            mainIamgeView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            mainIamgeView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -120)
        ])
        self.addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: mainIamgeView.bottomAnchor, constant: 10),
            mainLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -150),
            mainLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -80)
        ])
        self.addSubview(firstLaunchLabel)
        NSLayoutConstraint.activate([
            firstLaunchLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 27),
            firstLaunchLabel.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            firstLaunchLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -250),
            firstLaunchLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
        self.addSubview(launchDateLabel)
        NSLayoutConstraint.activate([
            launchDateLabel.topAnchor.constraint(equalTo: firstLaunchLabel.bottomAnchor, constant: 2),
            launchDateLabel.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            launchDateLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -200),
            launchDateLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        self.addSubview(launchCostLabel)
        NSLayoutConstraint.activate([
            launchCostLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 27),
            launchCostLabel.leadingAnchor.constraint(equalTo: firstLaunchLabel.trailingAnchor, constant: 60),
            launchCostLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            launchCostLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
        self.addSubview(costLabel)
        NSLayoutConstraint.activate([
            costLabel.topAnchor.constraint(equalTo: launchCostLabel.bottomAnchor, constant: 2),
            costLabel.leadingAnchor.constraint(equalTo: launchCostLabel.leadingAnchor),
            costLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -110),
            costLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        self.addSubview(successLabel)
        NSLayoutConstraint.activate([
            successLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 27),
            successLabel.leadingAnchor.constraint(equalTo: launchCostLabel.trailingAnchor, constant: 30),
            successLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            successLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
}
