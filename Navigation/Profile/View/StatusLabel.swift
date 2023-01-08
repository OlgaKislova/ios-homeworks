//
//  StatusLabel.swift
//  Navigation
//
//  Created by Kislova Olga on 27.12.2022.
//

import UIKit

class StatusLabel: UILabel {
    init() {
        super.init(frame: .zero)
    
        self.font = UIFont(name: "Rockwell-Regular", size: 14)
        self.textColor = .gray
        self.text = "Waiting for the holidays..."
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
