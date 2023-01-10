//
//  DividerView.swift
//  Navigation
//
//  Created by Olga Kislova on 10.01.2023.
//

import UIKit

class DividerView: UIView {
    init() {
        super.init(frame: .zero)
    
        self.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
