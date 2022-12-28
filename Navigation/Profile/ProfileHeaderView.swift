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
    private let statusButtonLView = SetStatusButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    private var navigationBarHeight: CGFloat { self.safeAreaInsets.top }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        configure()
    }
    
    @objc
    func showStatus() {
        print(self.subTitleLView.text ?? "")
    }
    
    public func configure() {
        self.addSubview(avatarIView)
        self.addSubview(titleLView)
        self.addSubview(subTitleLView)
        self.addSubview(statusButtonLView)
        
        statusButtonLView.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
    }

    public func recalculationPosition() {
        avatarIView.frame = CGRect(
            x: 16,
            y: navigationBarHeight + 16,
            width: avatarIView.frame.width,
            height: avatarIView.frame.height
        )
        
        titleLView.frame = CGRect(
            x: avatarIView.frame.maxX + 16,
            y: navigationBarHeight + 27,
            width: self.frame.width - avatarIView.frame.maxX - 32,
            height: titleLView.frame.height
        )
        
        subTitleLView.frame = CGRect(
            x: avatarIView.frame.maxX + 16,
            y: avatarIView.frame.maxY - 36,
            width: self.frame.width - avatarIView.frame.maxX - 32,
            height: subTitleLView.frame.height
        )
        
        statusButtonLView.frame = CGRect(
            x: 16,
            y: avatarIView.frame.maxY + 16,
            width: self.frame.width - 32,
            height: 50
        )
    }
}
