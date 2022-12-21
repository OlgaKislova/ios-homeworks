//
//  FeedViewController.swift
//  Navigation
//
//  Created by Kislov Vadim on 21.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Лента"
        self.view.backgroundColor = .white
        
        let button = createPostButton()
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc
    func postButtonAction() {
        self.navigationController?.pushViewController(PostViewController(), animated: false)
    }
    
    private func createPostButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать пост", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(postButtonAction), for: .touchUpInside)
        
        return button
    }
}
