//
//  DetailedPostViewController.swift
//  Navigation
//
//  Created by Kislova Olga on 01.02.2023.
//

import UIKit

class DetailedPostViewController: UIViewController {
    var post: Post!
    var indexCell: Int!
    var postServiceDelegate: PostServiceDelegate!
    
    private let indent: CGFloat = 16
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        
        label.translatesAutoresizingMaskIntoConstraints = false
    
        return label
    }()
    
    private let imagePostView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.isUserInteractionEnabled = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public let labelViewStack: UIStackView = {
        let viewStack = UIStackView()
        
        viewStack.axis = .horizontal
        viewStack.distribution = .equalSpacing
        viewStack.translatesAutoresizingMaskIntoConstraints = false
        
        return viewStack
    }()
    
    private let likesLabel = InformationLabelView()
    private let viewsLabel = InformationLabelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setSubviews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setAppearance()
    }
    
    private func configure() {
        authorLabel.text = post.author
        imagePostView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
        
        likesLabel.isUserInteractionEnabled = true
        
        let tapLikesGesture = UITapGestureRecognizer(target: self, action: #selector(changeCountOfLike))
        likesLabel.addGestureRecognizer(tapLikesGesture)
    }
    
    private func setSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        labelViewStack.addArrangedSubview(likesLabel)
        labelViewStack.addArrangedSubview(viewsLabel)
        
        contentView.addSubview(authorLabel)
        contentView.addSubview(imagePostView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(labelViewStack)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: indent),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indent),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indent),
            
            imagePostView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            imagePostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePostView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: imagePostView.bottomAnchor, constant: indent),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indent),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indent),
            
            labelViewStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: indent),
            labelViewStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indent),
            labelViewStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indent),
            labelViewStack.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -indent)
        ])
    }
    
    private func setAppearance() {
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc
    private func changeCountOfLike() {
        postServiceDelegate.changeCountOfLikes(for: indexCell)
        
        post.likes += 1
        likesLabel.text = "Likes: \(post.likes)"
    }
}
