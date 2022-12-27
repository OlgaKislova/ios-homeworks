//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Kislov Vadim on 21.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Профиль"
        self.view.backgroundColor = .lightGray
        self.navigationController?.navigationBar.backgroundColor = .white
        
        setScrollAppearance()
        
        self.view.addSubview(headerView)
    }
    
    override func viewWillLayoutSubviews() {
        headerView.frame = self.view.frame
        
        headerView.recalculationPosition()
    }
    
    private func setScrollAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
