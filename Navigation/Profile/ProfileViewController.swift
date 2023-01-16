//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Kislova Olga on 21.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        
        return tableView
    }()
    
    private let posts = Post.getPostsAboutCats()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Профиль"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.backgroundColor = .white
        
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        
        cell.configure(post: posts[indexPath.row])
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ProfileHeaderView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
