//
//  CustomTextView.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/14/21.
//

import UIKit

class CustomTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: "Roboto-Medium", size: 14)
        self.textColor = .smookyBlack
        self.textAlignment = .left
        self.isScrollEnabled = false
        self.isEditable = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
