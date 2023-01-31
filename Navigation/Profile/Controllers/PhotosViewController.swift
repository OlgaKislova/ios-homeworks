//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Kislova Olga on 31.01.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    private let photos = Photo.getPhotos()
    
    private let indent: CGFloat = 8
    
    private lazy var photosCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.isUserInteractionEnabled = false
        view.alpha = 0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var fullImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        imageView.isUserInteractionEnabled = true
        imageView.alpha = 0
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosCV.delegate = self
        photosCV.dataSource = self
        
        setViews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        photosCV.layoutIfNeeded()
        setAppearance()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setViews() {
        view.addSubview(photosCV)
        view.addSubview(backgroundView)
        view.addSubview(fullImageView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photosCV.topAnchor.constraint(equalTo: view.topAnchor),
            photosCV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosCV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photosCV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            fullImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            fullImageView.heightAnchor.constraint(equalTo: fullImageView.widthAnchor),
        ])
    }
    
    private func setAppearance() {
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isHidden = false
    }
    /// Show image
    /// @return - id image
    private func showFullScreenImage() {
        UIView.animate(withDuration: 0.5,
                       animations: {
                            self.backgroundView.alpha = 0.8
                            self.fullImageView.alpha = 1
                            self.photosCV.isScrollEnabled = false
                            self.photosCV.isUserInteractionEnabled = false
                        },
                       completion: { _ in
                            UIView.animate(withDuration: 0.3) { [self] in
                                let closeBarItem = UIBarButtonItem(image: UIImage(systemName: "multiply.circle"),
                                                                   style: .plain,
                                                                   target: self,
                                                                   action: #selector(self.hideFullScreenImage)
                                )
                
                                navigationItem.rightBarButtonItem = closeBarItem
                                self.photosCV.layoutIfNeeded()
                            }
        })
    }
    
    @objc
    private func hideFullScreenImage() {
        UIView.animate(withDuration: 0.3,
                       animations:  { self.navigationItem.rightBarButtonItem = .none },
                       completion: { _ in
                            UIView.animate(withDuration: 0.5, delay: 0.0) {
                                self.backgroundView.alpha = 0
                                self.fullImageView.alpha = 0
                                self.fullImageView.isUserInteractionEnabled = true
                       
                                self.photosCV.isScrollEnabled = true
                                self.photosCV.isUserInteractionEnabled = true
                                self.photosCV.layoutIfNeeded()
                            }
        })
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        let photo = photos[indexPath.item]
        
        item.configure(photo: photo)
        
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - 4 * indent) / 3
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        indent
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        indent
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: indent, left: indent, bottom: indent, right: indent)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        fullImageView.image = UIImage(named: photos[indexPath.item].name)
        
        showFullScreenImage()
    }
}
