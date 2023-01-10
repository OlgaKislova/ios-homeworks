//
//  LoginButton.swift
//  Navigation
//
//  Created by Olga Kislova on 10.01.2023.
//

import UIKit

class LoginButton: UIButton {
    init() {
        super.init(frame: .zero)
    
        self.setTitle("Log in", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.setBackgroundImage(UIImage(named: "blue_pixel.png"), for: .normal)
        self.clipsToBounds = true
        
        self.layer.cornerRadius = 10
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
