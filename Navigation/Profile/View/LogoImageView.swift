//
//  LogoImageView.swift
//  Navigation
//
//  Created by Olga Kislova on 08.01.2023.
//

import UIKit

class LogoImageView: UIImageView {
    init() {
        super.init(frame: .zero)

        self.clipsToBounds = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.image = UIImage(named: "logo")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
