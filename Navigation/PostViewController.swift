//
//  PostViewController.swift
//  Navigation
//
//  Created by Kislov Vadim on 21.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    public var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.title = post?.title
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "eye"),
            style: .plain,
            target: self,
            action: #selector(showInfoView)
        )
    }
    
    @objc
    func showInfoView() {
        let vc = InfoViewController()
        
        vc.post = post
        
        self.present(vc, animated: false)
    }
}
