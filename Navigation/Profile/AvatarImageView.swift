//
//  AvatarImageView.swift
//  Navigation
//
//  Created by Kislova Olga on 27.12.2022.
//

import UIKit

class AvatarImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.image = UIImage(named: "orange-cat")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = CGFloat(self.frame.width / 2)
    }
}
