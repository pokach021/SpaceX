//
//  DetailStackView.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/14/21.
//

import UIKit

class DetailStackView: UIStackView {

    init(description: [String], descriptionFromWeb: [String]) {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 15
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(setupFirstStackView(subviewsNames: description))
        self.addArrangedSubview(setupSecondStackView(subviewsNames: descriptionFromWeb))
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupFirstStackView(subviewsNames: [String]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        for name in subviewsNames {
            let label = CustomLabel(labelColor: .smookyBlack, labelFontSize: 14)
            label.text = name
            stackView.addArrangedSubview(label)
        }
        return stackView
    }
    
    func setupSecondStackView(subviewsNames: [String]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        for name in subviewsNames {
            let label = CustomLabel(labelColor: .slateGray, labelFontSize: 14)
            label.text = name
            stackView.addArrangedSubview(label)
        }
        return stackView
    }
    
}
