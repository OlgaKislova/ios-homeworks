//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Olga Kislova on 13.01.2023.
//

import UIKit

protocol PostTableViewCellDelegate {
    func showPostView(for index: Int)
}

class PostTableViewCell: UITableViewCell {
    public var delegate: PostTableViewCellDelegate!
    public var postServiceDelegate: PostServiceDelegate!
    public var indexCell: Int!
    
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
        label.numberOfLines = 2
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

        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func configure(post: Post, index: Int) {
        indexCell = index
        authorLabel.text = post.author
        imagePostView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
    private func setSubviews() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(imagePostView)
        contentView.addSubview(descriptionLabel)
        
        labelViewStack.addArrangedSubview(likesLabel)
        labelViewStack.addArrangedSubview(viewsLabel)
        
        likesLabel.isUserInteractionEnabled = true
        
        contentView.addSubview(labelViewStack)
        
        let tapLikesGesture = UITapGestureRecognizer(target: self, action: #selector(changeCountOfLike))
        likesLabel.addGestureRecognizer(tapLikesGesture)
        
        let tapImageGesture = UITapGestureRecognizer(target: self, action: #selector(showPostView))
        imagePostView.addGestureRecognizer(tapImageGesture)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            imagePostView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            imagePostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePostView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            imagePostView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: imagePostView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            labelViewStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            labelViewStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelViewStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            labelViewStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    @objc
    private func changeCountOfLike() {
        postServiceDelegate.changeCountOfLikes(for: indexCell)
    }
    
    @objc
    private func showPostView() {
        delegate.showPostView(for: indexCell)
    }
}
