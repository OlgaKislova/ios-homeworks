//
//  FullNameLabel.swift
//  Navigation
//
//  Created by Kislova Olga on 27.12.2022.
//

import UIKit

class FullNameLabel: UILabel {
    init() {
        super.init(frame: .zero)
    
        self.font = UIFont(name: "Rockwell-Bold", size: 18)
        self.textColor = .black
        self.text = "Just a tired cat"
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
