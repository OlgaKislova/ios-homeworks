//
//  StatusButtonView.swift
//  Navigation
//
//  Created by Kislov Vadim on 27.12.2022.
//

import UIKit

class StatusButtonView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.setTitle("Show status", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .systemBlue
        
        self.layer.cornerRadius = 4
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
