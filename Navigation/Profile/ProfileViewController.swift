//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Kislova Olga on 21.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Профиль"
        self.view.backgroundColor = .lightGray
        self.navigationController?.navigationBar.backgroundColor = .white
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(headerView)
        
        setScrollAppearance()
        setConstraints()
    }
    
    private func setScrollAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 220),
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}
