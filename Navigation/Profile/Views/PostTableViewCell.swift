//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Olga Kislova on 13.01.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addSubview(authorLabel)
        self.addSubview(imagePostView)
        self.addSubview(descriptionLabel)
        
        labelViewStack.addArrangedSubview(likesLabel)
        labelViewStack.addArrangedSubview(viewsLabel)
        
        self.addSubview(labelViewStack)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func configure(post: Post) {
        authorLabel.text = post.author
        imagePostView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            imagePostView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            imagePostView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imagePostView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            imagePostView.heightAnchor.constraint(equalTo: self.widthAnchor),
            imagePostView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: imagePostView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            labelViewStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            labelViewStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelViewStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            labelViewStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
}
