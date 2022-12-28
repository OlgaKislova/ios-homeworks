//
//  TitleLabelView.swift
//  Navigation
//
//  Created by Kislov Vadim on 27.12.2022.
//

import UIKit

class TitleLabelView: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.font = UIFont(name: "Rockwell-Bold", size: 18)
        self.textColor = .black
        self.text = "Just a tired cat"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
