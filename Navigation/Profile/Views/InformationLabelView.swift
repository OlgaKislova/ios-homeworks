//
//  InformationLabelView.swift
//  Navigation
//
//  Created by Olga Kislova on 13.01.2023.
//

import UIKit

class InformationLabelView: UILabel {
    init() {
        super.init(frame: .zero)
        
        self.font = .systemFont(ofSize: 16)
        self.textColor = .black
        self.textAlignment = .left
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
