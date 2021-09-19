//
//  UIShadowLabel.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/19/21.
//

import UIKit

class UIShadowLabel: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var text: String = ""
    
    lazy var firstShadow: UIView = {
        let shadow = UIView()
        shadow.frame = self.bounds
        shadow.backgroundColor = self.backgroundColor
        shadow.layer.cornerRadius = self.layer.cornerRadius
        shadow.layer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        shadow.layer.shadowOpacity = 1
        shadow.layer.shadowOffset = CGSize(width: -1, height: -1)
        shadow.layer.shadowRadius = 3
        shadow.layer.masksToBounds = false

        return shadow
    }()

    lazy var secondShadow: UIView = {
        let shadow = UIView()
        shadow.frame = self.bounds
        shadow.layer.cornerRadius = self.layer.cornerRadius
        shadow.backgroundColor = self.backgroundColor
        shadow.layer.shadowColor = UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.4).cgColor
        shadow.layer.shadowOpacity = 1
        shadow.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        shadow.layer.shadowRadius = 3
        shadow.layer.masksToBounds = false

        return shadow
    }()

    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.frame = self.bounds
        label.backgroundColor = self.backgroundColor
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Medium", size: 17)
        label.textColor = .cyanProcess
        label.layer.cornerRadius = self.layer.cornerRadius
        label.text = text
        label.layer.masksToBounds = true
        
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(firstShadow)
        self.addSubview(secondShadow)
        self.addSubview(mainLabel)
        firstShadow.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        secondShadow.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath


    }


}
