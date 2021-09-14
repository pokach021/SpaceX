//
//  RocketCollectionViewCell.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/9/21.
//

import UIKit
import Foundation

class RocketCollectionViewCell: UICollectionViewCell {
    
    lazy var mainLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
    
    lazy var firstLaunchLabel: CustomLabel = {
        let firstLaunchLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 14)
        firstLaunchLabel.text = "First Launch"
        return firstLaunchLabel
    }()
    
    lazy var launchCostLabel: CustomLabel = {
        let launchCostLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 14)
        launchCostLabel.text = "Launch cost"
        return launchCostLabel
    }()
    
    lazy var successLabel: CustomLabel = {
        let successLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 14)
        successLabel.text = "Success"
        return successLabel
    }()
    
    lazy var launchDateLabel = CustomLabel(labelColor: .slateGray, labelFontSize: 14)
    lazy var costLabel = CustomLabel(labelColor: .slateGray, labelFontSize: 14)
    lazy var percentLabel = CustomLabel(labelColor: .slateGray, labelFontSize: 14)
    
    lazy var mainImageView: UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.backgroundColor = .black
        mainImageView.layer.cornerRadius = 10
        return mainImageView
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
    /// Adding constraints to subviews
    func setupLayout() {
        self.addSubview(mainImageView)
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -120)
        ])
        self.addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10),
            mainLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -150),
            mainLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -80)
        ])
        
        let firstStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [firstLaunchLabel, launchCostLabel, successLabel])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 30
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let secondStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [launchDateLabel, costLabel, percentLabel])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 30
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let verticalStackView: UIStackView = {
            let verticalStackView = UIStackView(arrangedSubviews: [firstStackView, secondStackView])
            verticalStackView.axis = .vertical
            verticalStackView.distribution = .fillEqually
            verticalStackView.spacing = 2
            verticalStackView.translatesAutoresizingMaskIntoConstraints = false
            return verticalStackView
        }()
        
        self.addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 27),
            verticalStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func configureWithItem(rocket: RocketModel) {
        self.mainLabel.text = rocket.name
        self.costLabel.text = "\(rocket.cost_per_launch)$"
        self.percentLabel.text = "\(rocket.success_rate_pct)%"
        self.launchDateLabel.text = rocket.first_flight
        
    }
    
}



