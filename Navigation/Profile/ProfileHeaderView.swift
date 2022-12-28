//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Kislova Olga on 25.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    private let avatarImageView = AvatarImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    private let fullNameLabel = FullNameLabel()
    private let statusLabel = StatusLabel()
    private let setStatusButton = StatusButton()
    
    override func willMove(toSuperview newSuperview: UIView?) {
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        
        setStatusButton.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
        
        setConstraints()
    }
    
    @objc
    func showStatus() {
        print(self.statusLabel.text ?? "")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            statusLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -36),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusLabel.heightAnchor.constraint(equalToConstant: 18),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
