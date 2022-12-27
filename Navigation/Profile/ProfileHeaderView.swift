//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Kislov Vadim on 25.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    private let avatarIView = AvatarImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    private let titleLView = TitleLabelView(frame: CGRect(x: 0, y: 0, width: 180, height: 18))
    private let subTitleLView = SubTitleLabelView(frame: CGRect(x: 0, y: 0, width: 180, height: 18))
    
    private var navigationBarHeight: CGFloat { self.safeAreaInsets.top }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        configure()
    }
    
    public func configure() {
        self.addSubview(avatarIView)
        self.addSubview(titleLView)
        self.addSubview(subTitleLView)
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
            width: titleLView.frame.width,
            height: titleLView.frame.height
        )
        
        subTitleLView.frame = CGRect(
            x: avatarIView.frame.maxX + 16,
            y: avatarIView.frame.maxY - 36,
            width: subTitleLView.frame.width,
            height: subTitleLView.frame.height
        )
    }
}
