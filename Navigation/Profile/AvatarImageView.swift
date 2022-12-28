//
//  AvatarImageView.swift
//  Navigation
//
//  Created by Kislov Vadim on 27.12.2022.
//

import UIKit

class AvatarImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.layer.borderWidth = 3
        self.layer.cornerRadius = CGFloat(frame.width / 2)
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
        
        self.image = UIImage(named: "orange-cat")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
