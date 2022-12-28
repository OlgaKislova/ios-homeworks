//
//  FullNameLabel.swift
//  Navigation
//
//  Created by Kislova Olga on 27.12.2022.
//

import UIKit

class FullNameLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.font = UIFont(name: "Rockwell-Bold", size: 18)
        self.textColor = .black
        self.text = "Just a tired cat"
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
