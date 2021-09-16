//
//  WBButton.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/15/21.
//

import UIKit

class WBButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.coral, for: .normal)
        self.layer.cornerRadius = 15
        self.backgroundColor = .white
        self.tintColor = .coral
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 17)
        self.titleLabel?.textAlignment = .left
        
//        self.setImage(UIImage(named: "button-link"), for: .normal)
//        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -90)
        
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
