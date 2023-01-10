//
//  FieldStackView.swift
//  Navigation
//
//  Created by Olga Kislova on 08.01.2023.
//

import UIKit

class FieldStackView: UIStackView {

    
    init() {
        super.init(frame: .zero)

        self.backgroundColor = .systemGray5
        self.axis = .vertical
        self.spacing = 0
        self.alignment = .fill
        self.distribution = .fillProportionally
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
