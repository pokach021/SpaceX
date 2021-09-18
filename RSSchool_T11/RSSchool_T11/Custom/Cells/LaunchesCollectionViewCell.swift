//
//  LaunchesCollectionViewCell.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/16/21.
//

import UIKit

class LaunchesCollectionViewCell: UICollectionViewCell {
    
    lazy var mainLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 24)
    
    lazy var dateLabel: CustomLabel = {
        let dateLabel = CustomLabel(labelColor: .smookyBlack, labelFontSize: 17)
        dateLabel.font = UIFont(name: "Roboto-Medium", size: 17)
        return dateLabel
    }()
    
    lazy var patchLabel: UILabel = {
        let patchLabel = UILabel()
        patchLabel.translatesAutoresizingMaskIntoConstraints = false
        patchLabel.layer.cornerRadius = 20
        patchLabel.backgroundColor = .almostWhite
        return patchLabel
    }()
    
    lazy var patchLabelImageView: UIImageView = {
        let patchLabelImageView = UIImageView()
        patchLabelImageView.translatesAutoresizingMaskIntoConstraints = false
        patchLabelImageView.clipsToBounds = false
        patchLabelImageView.backgroundColor = .almostWhite
        return patchLabelImageView
    }()
    
    lazy var processLabel: UILabel = {
        let processLabel = UILabel()
        processLabel.translatesAutoresizingMaskIntoConstraints = false
        processLabel.backgroundColor = .almostWhite
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
        numberLabel.backgroundColor = .almostWhite
        numberLabel.layer.cornerRadius = 15
        return numberLabel
    }()
    // MARK: Adding layers
    override func layoutSubviews() {
        super.layoutSubviews()
        numberLabel.createShadows()
        processLabel.createShadows()
        patchLabel.createShadows()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        self.backgroundColor = .almostWhite
        self.layer.cornerRadius = 15
    }
    
    func setupLayout() {
        self.addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -150),
            mainLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -95)
        ])
        self.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -230),
            dateLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -70)
        ])
        self.addSubview(patchLabel)
        NSLayoutConstraint.activate([
            patchLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor),
            patchLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            patchLabel.heightAnchor.constraint(equalTo: patchLabel.widthAnchor),
            patchLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        patchLabel.addSubview(patchLabelImageView)
        NSLayoutConstraint.activate([
            patchLabelImageView.topAnchor.constraint(equalTo: patchLabel.topAnchor, constant: 15),
            patchLabelImageView.bottomAnchor.constraint(equalTo: patchLabel.bottomAnchor, constant: -15),
            patchLabelImageView.leadingAnchor.constraint(equalTo: patchLabel.leadingAnchor, constant: 9),
            patchLabelImageView.trailingAnchor.constraint(equalTo: patchLabel.trailingAnchor, constant: -9)
        ])
        self.addSubview(processLabel)
        NSLayoutConstraint.activate([
            processLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            processLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            processLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17),
            processLabel.widthAnchor.constraint(equalTo: processLabel.heightAnchor)
        ])
        self.addSubview(numberLabel)
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            numberLabel.leadingAnchor.constraint(equalTo: processLabel.trailingAnchor, constant: 10),
            numberLabel.trailingAnchor.constraint(equalTo: patchLabel.leadingAnchor, constant: -100),
            numberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17)
        ])
    }
    
    func configureWithItem(launch: LaunchesModel) {
        
        self.mainLabel.text = launch.name
        self.dateLabel.text = launch.date_utc
        self.numberLabel.text = "#\(launch.flight_number)"
        
        guard let url = URL(string: launch.links.patch.small ?? "https://images2.imgbox.com/53/22/dh0XSLXO_o.png") else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.patchLabelImageView.image = image
                }
            }
        }.resume()
    }
    
}
