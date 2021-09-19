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
        self.backgroundColor = .almostWhite
        self.tintColor = .coral
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 17)
        self.titleLabel?.textAlignment = .left
        
//        self.setImage(UIImage(named: "button-link"), for: .normal)
//        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -90)
        
//        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 2)
//        self.layer.shadowOpacity = 1
//        self.layer.masksToBounds = false
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.createShadow(color: UIColor(red: 1, green: 1, blue: 1, alpha: 1), offset: CGSize(width: -6, height: -6), btnLayer: self.layer)
        self.createShadow(color: UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.4), offset: CGSize(width: 6, height: 6), btnLayer: self.layer)
//        self.layer.insertSublayer(createShadow(color: UIColor(red: 1, green: 1, blue: 1, alpha: 1), offset: CGSize(width: -1, height: -1)), at: 0)
//        self.layer.insertSublayer(createShadow(color: UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.4), offset: CGSize(width: 1.5, height: 1.5)), at: 0)
    }
    
  
    
//    func createShadow(color: UIColor, offset: CGSize) -> CAShapeLayer {
//        let shadowLayer = CAShapeLayer()
//        shadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: CGFloat(15)).cgPath
//        shadowLayer.fillColor = self.backgroundColor?.cgColor
//        shadowLayer.shadowPath = shadowLayer.path
//
//        //shadowLayer.masksToBounds = false
//        shadowLayer.shadowColor = color.cgColor
//        shadowLayer.shadowOpacity = 1
//        shadowLayer.shadowOffset = offset
//        shadowLayer.shadowRadius = 3
//
//        return shadowLayer
//    }
    
    func createShadow(color: UIColor, offset: CGSize, btnLayer: CALayer) {
        btnLayer.masksToBounds = false
        btnLayer.shadowColor = color.cgColor
        btnLayer.shadowOpacity = 1
        btnLayer.shadowOffset = offset
        btnLayer.shadowRadius = 3
    }
}
