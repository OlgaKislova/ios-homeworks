//
//  StatusLabel.swift
//  Navigation
//
//  Created by Kislova Olga on 27.12.2022.
//

import UIKit

class StatusLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.font = UIFont(name: "Rockwell-Regular", size: 14)
        self.textColor = .gray
        self.text = "Waiting for the holidays..."
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
