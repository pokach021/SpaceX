//
//  Shadow.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/18/21.
//

import Foundation
import UIKit

extension UIView {
    
    static func createShadows(view: UIView) -> [CALayer] {
        
        view.layer.masksToBounds = false
        view.clipsToBounds = false
        
        let firstShadowLayer = CAShapeLayer()
        
        firstShadowLayer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
        firstShadowLayer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        firstShadowLayer.shadowOpacity = 1
        firstShadowLayer.shadowOffset = CGSize(width: -1, height: -1)
        firstShadowLayer.shadowRadius = 3
        firstShadowLayer.zPosition = -1
        
        view.layer.addSublayer(firstShadowLayer)
        
        let secondShadowLayer = CAShapeLayer()
        
        secondShadowLayer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
        secondShadowLayer.shadowColor = UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.4).cgColor
        secondShadowLayer.shadowOpacity = 1
        secondShadowLayer.shadowOffset = CGSize(width: 1, height: 1)
        secondShadowLayer.shadowRadius = 3
        secondShadowLayer.zPosition = -1
        
        view.layer.addSublayer(secondShadowLayer)
        
        let backgroundLayer = CAShapeLayer()
        
        backgroundLayer.backgroundColor = view.backgroundColor?.cgColor
        backgroundLayer.cornerRadius = view.layer.cornerRadius
        backgroundLayer.zPosition = -1
        view.layer.addSublayer(backgroundLayer)

        return [firstShadowLayer, secondShadowLayer, backgroundLayer]
    }
}
//    func createShadows() {
//
//
//        let firstShadowLayer = CAShapeLayer()
//        firstShadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
//        firstShadowLayer.fillColor = self.backgroundColor?.cgColor
//        firstShadowLayer.shadowPath = firstShadowLayer.path
//
//        firstShadowLayer.masksToBounds = false
//        firstShadowLayer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
//        firstShadowLayer.shadowOpacity = 1
//        firstShadowLayer.shadowOffset = CGSize(width: -1, height: -1)
//        firstShadowLayer.shadowRadius = 3
//
//        self.layer.insertSublayer(firstShadowLayer, at: 0)
//        //self.layer.addSublayer(firstShadowLayer)
//
//        let secondShadowLayer = CAShapeLayer()
//        secondShadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
//        secondShadowLayer.fillColor = self.backgroundColor?.cgColor
//        secondShadowLayer.shadowPath = secondShadowLayer.path
//
//        secondShadowLayer.masksToBounds = false
//        secondShadowLayer.shadowColor = UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.4).cgColor
//        secondShadowLayer.shadowOpacity = 1
//        secondShadowLayer.shadowOffset = CGSize(width: 1, height: 1)
//        secondShadowLayer.shadowRadius = 3
//
//        self.layer.insertSublayer(secondShadowLayer, at: 0)
//        //self.layer.addSublayer(secondShadowLayer)
//
//    }
//}


//func createFirstShadow() {
////        self.layer.masksToBounds = false
////        self.layer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
////        self.layer.shadowOpacity = 1
////        self.layer.shadowOffset = CGSize(width: -1, height: -1)
////        self.layer.shadowRadius = 3
//        let firstShadowLayer = CAShapeLayer()
//        firstShadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
//        firstShadowLayer.fillColor = self.backgroundColor?.cgColor
//        firstShadowLayer.shadowPath = firstShadowLayer.path
//
//        firstShadowLayer.masksToBounds = false
//        firstShadowLayer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
//        firstShadowLayer.shadowOpacity = 1
//        firstShadowLayer.shadowOffset = CGSize(width: -1, height: -1)
//        firstShadowLayer.shadowRadius = 3
//
//        self.layer.insertSublayer(firstShadowLayer, at: 0)
//        //self.layer.zPosition = 1
//    }
//
//    func createSecondShadow() {
////        self.layer.masksToBounds = false
////        self.layer.shadowColor = UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.4).cgColor
////        self.layer.shadowOpacity = 1
////        self.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
////        self.layer.shadowRadius = 3
//
//        let secondShadowLayer = CAShapeLayer()
//        secondShadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
//        secondShadowLayer.fillColor = self.backgroundColor?.cgColor
//        secondShadowLayer.shadowPath = secondShadowLayer.path
//
//        secondShadowLayer.masksToBounds = false
//        secondShadowLayer.shadowColor = UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 1).cgColor
//        secondShadowLayer.shadowOpacity = 1
//        secondShadowLayer.shadowOffset = CGSize(width: 1.5, height: 1.5)
//        secondShadowLayer.shadowRadius = 3
//
//        self.layer.insertSublayer(secondShadowLayer, at: 0)
//
//    }
