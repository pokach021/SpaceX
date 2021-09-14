//
//  CustomLabel.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/14/21.
//

import UIKit

class CustomLabel: UILabel {

    init(labelColor: UIColor, labelFontSize: CGFloat) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: "Roboto-Bold", size: labelFontSize)
        self.textColor = labelColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



