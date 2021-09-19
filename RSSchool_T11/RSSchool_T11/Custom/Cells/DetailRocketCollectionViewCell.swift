//
//  DetailRocketCollectionViewCell.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/14/21.
//

import UIKit

class DetailRocketCollectionViewCell: UICollectionViewCell {
    
    
    lazy var mainImageView: UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.backgroundColor = .black
        mainImageView.layer.cornerRadius = 7
        return mainImageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.createShadows()
//    }
    
    func setupLayout() {
        self.addSubview(mainImageView)
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3)
        ])
    }
    
    func configureWithItem(imageUrlStr: String) {
        let session = URLSession.shared
       
            guard let url = URL(string: imageUrlStr) else { return }
            
            session.dataTask(with: url) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.mainImageView.image = image
                    }
                }
            }.resume()
        }
        
}
