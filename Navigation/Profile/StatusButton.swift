//
//  StatusButton.swift
//  Navigation
//
//  Created by Kislova Olga on 27.12.2022.
//

import UIKit

class StatusButton: UIButton {
    init() {
        super.init(frame: .zero)
    
        self.setTitle("Show status", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .systemBlue
        
        self.layer.cornerRadius = 4
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
