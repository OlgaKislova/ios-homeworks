//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Kislova Olga on 25.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "orange-cat")
        
        return imageView
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Rockwell-Bold", size: 18)
        label.textColor = .black
        label.text = "Just a tired cat"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Rockwell-Regular", size: 14)
        label.textColor = .gray
        label.text = "Waiting for the holidays..."
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let setStatusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        
        button.layer.cornerRadius = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var statusTextField: UITextField = {
        let statusTextField = UITextField()
        
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.placeholder = "Enter new status"
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.clearButtonMode = .whileEditing
        
        statusTextField.autocorrectionType = .no
        statusTextField.returnKeyType = .done
        statusTextField.enablesReturnKeyAutomatically = true
        
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        
        return statusTextField
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        statusTextField.delegate = self
        setStatusButton.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.layer.cornerRadius = CGFloat(avatarImageView.frame.width / 2)
    }
    
    @objc
    func setStatus() {
        let statusText = statusTextField.text ?? ""
        
        if statusText.isEmpty {
            shakeAnimation(for: statusTextField)
        } else {
            statusLabel.text = statusText
            statusTextField.text = ""
        }
        
        dismissKeyboard()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            statusLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -36),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusLabel.heightAnchor.constraint(equalToConstant: 18),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 12),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    private func shakeAnimation(for textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.duration = 0.05

        animation.fromValue = CGPoint(x: textField.center.x - 3, y: textField.center.y)
        animation.toValue = CGPoint(x: textField.center.x + 3, y: textField.center.y)
        
        textField.layer.add(animation, forKey: "position")
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setStatus()
        
        return true
    }
    
    @objc
    func dismissKeyboard() {
        self.endEditing(true)
    }
}
