//
//  TextFieldView.swift
//  Navigation
//
//  Created by Olga Kislova on 08.01.2023.
//

import UIKit

class TextFieldView: UITextField {
    init(isSecureTextEntry: Bool, placeholder: String) {
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.font = .systemFont(ofSize: 16)
        self.textColor = .black
        self.tintColor = UIColor(named: "AccentColor")
        self.autocapitalizationType = .none
        self.isSecureTextEntry = isSecureTextEntry
        self.clearButtonMode = .whileEditing
        self.autocorrectionType = .no
        self.returnKeyType = .done
        self.enablesReturnKeyAutomatically = true
        
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftViewMode = .always
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
