//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Kislova Olga on 21.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private let headerView = ProfileHeaderView()
    private let showAlertButton = StatusButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Профиль"
        self.view.backgroundColor = .lightGray
        self.navigationController?.navigationBar.backgroundColor = .white
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        showAlertButton.setTitle("Show message", for: .normal)
        showAlertButton.layer.cornerRadius = 0
        showAlertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        self.view.addSubview(headerView)
        self.view.addSubview(showAlertButton)
        
        setScrollAppearance()
        setConstraints()
    }
    
    @objc
    func showAlert() {
        let post = Post(title: "Новый год", message: "С праздником чудес и исполнения желаний – с Новым годом!")
        
        let alert = UIAlertController(title: post.title, message: post.message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(doneAction)
        
        present(alert, animated: true)
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
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            showAlertButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            showAlertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            showAlertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            showAlertButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
