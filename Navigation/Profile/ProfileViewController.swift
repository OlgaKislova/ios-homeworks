//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Kislova Olga on 21.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private let headerView = ProfileHeaderView()
    
    private let showAlertButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Show message", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        
        button.layer.cornerRadius = 0
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Профиль"
        self.view.backgroundColor = .lightGray
        self.navigationController?.navigationBar.backgroundColor = .white
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
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
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: self.showAlertButton.topAnchor, constant: 0),
            
            showAlertButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            showAlertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            showAlertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            showAlertButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
