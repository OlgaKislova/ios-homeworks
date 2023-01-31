//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Kislova Olga on 31.01.2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(photo: Photo) {
        imageView.image = UIImage(named: photo.name)
    }
    
    private func addSubviews() {
        addSubview(imageView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
