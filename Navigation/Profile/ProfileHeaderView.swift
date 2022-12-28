//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Kislova Olga on 25.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    private let avatarIView = AvatarImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    private let titleLView = FullNameLabel(frame: CGRect(x: 0, y: 0, width: 180, height: 18))
    private let subTitleLView = StatusLabel(frame: CGRect(x: 0, y: 0, width: 180, height: 18))
    private let statusButtonView = SetStatusButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    override func willMove(toSuperview newSuperview: UIView?) {
        self.addSubview(avatarIView)
        self.addSubview(titleLView)
        self.addSubview(subTitleLView)
        self.addSubview(statusButtonView)
        
        setConstraints()
    }
    
    @objc
    func showStatus() {
        print(self.subTitleLView.text ?? "")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            avatarIView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarIView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarIView.widthAnchor.constraint(equalToConstant: 100),
            avatarIView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            titleLView.leadingAnchor.constraint(equalTo: avatarIView.trailingAnchor, constant: 16),
            titleLView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titleLView.heightAnchor.constraint(equalToConstant: 18),
            
            subTitleLView.topAnchor.constraint(equalTo: avatarIView.bottomAnchor, constant: -36),
            subTitleLView.leadingAnchor.constraint(equalTo: avatarIView.trailingAnchor, constant: 10),
            subTitleLView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            subTitleLView.heightAnchor.constraint(equalToConstant: 18),
            
            statusButtonView.topAnchor.constraint(equalTo: avatarIView.bottomAnchor, constant: 16),
            statusButtonView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusButtonView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusButtonView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        statusButtonView.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
    }
}
