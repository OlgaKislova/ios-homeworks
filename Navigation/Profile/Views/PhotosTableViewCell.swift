//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Kislova Olga on 31.01.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    private let photoSpacing: CGFloat = 8
    private let indent: CGFloat = 12
    private let countOfImages = 4
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Photos"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private lazy var arrowImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fill
        stackView.alignment = .center
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var photoStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.spacing = photoSpacing
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func configure(photos: [Photo]) {
        for (index, photo) in photos.enumerated() {
            let subviews = photoStackView.subviews
            
            guard let imageView = subviews[index] as? UIImageView else {
                break
            }
            
            imageView.image = UIImage(named: photo.name)
        }
    }
    
    private func setSubviews() {
        headerStackView.addArrangedSubview(headerLabel)
        headerStackView.addArrangedSubview(arrowImage)
        
        for _ in 0..<countOfImages {
            photoStackView.addArrangedSubview(getPhotoView())
        }
        
        addSubview(headerStackView)
        addSubview(photoStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topAnchor, constant: indent),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: indent),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -indent),
            
            photoStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: indent),
            photoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: indent),
            photoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -indent),
            photoStackView.heightAnchor.constraint(equalToConstant: (frame.width - 3 * photoSpacing - 2 * indent) / 4),
            photoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -indent)
        ])
    }
    
    private func getPhotoView() -> UIImageView {
        let photo = UIImageView()
        
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 6
        photo.clipsToBounds = true
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        return photo
    }
}
