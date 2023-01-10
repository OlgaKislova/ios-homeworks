//
//  LogInViewController.swift
//  Navigation
//
//  Created by Olga Kislova on 08.01.2023.
//

import UIKit

class LogInViewController: UIViewController {
    private let logoImageView = LogoImageView()
    private let loginTextField = TextFieldView(isSecureTextEntry: false, placeholder: "Email or phone")
    private let passwordTextField = TextFieldView(isSecureTextEntry: true, placeholder: "Password")
    private let fieldStackView = FieldStackView()
    private let dividerView = DividerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(logoImageView)
        
        fieldStackView.addArrangedSubview(loginTextField)
        fieldStackView.addArrangedSubview(dividerView)
        fieldStackView.addArrangedSubview(passwordTextField)
        
        self.view.addSubview(fieldStackView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fieldStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            fieldStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            fieldStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            fieldStackView.heightAnchor.constraint(equalToConstant: 100),
            
            dividerView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

extension LogInViewController: UITextFieldDelegate {
    
}
