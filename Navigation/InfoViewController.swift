//
//  InfoViewController.swift
//  Navigation
//
//  Created by Kislova Olga on 21.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    public var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let button = createButton()
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc
    func showAlert() {
        let alert = UIAlertController(title: post?.title, message: post?.message, preferredStyle: .alert)
        let actionHandler: (UIAlertAction) -> Void = { _ in print(self.post?.message ?? "") }
    
        let doneAction = UIAlertAction(title: "Ok", style: .default, handler: actionHandler)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: actionHandler)

        alert.addAction(doneAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func createButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать пост", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        return button
    }
}
