//
//  Cell.swift
//  Rick & Morty
//
//  Created by Student on 11/10/21.
//

import Foundation
import UIKit
import SDWebImage

class Cell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: Cell.self)
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        addSubview(image)
        
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        
        return image
    }()
    
    private lazy var name: UILabel = {
        let name = UILabel()
        
        name.translatesAutoresizingMaskIntoConstraints = false
        
        let layoutGuide = UILayoutGuide()
        addLayoutGuide(layoutGuide)
        addSubview(name)
        
        layoutGuide.trailingAnchor.constraint(equalTo: image.trailingAnchor).isActive = true
        
        name.leadingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: 4).isActive = true
        name.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        
        return name
    }()
    
    func setData(_ presentable: CharacterPresentable) {
        let url = URL(string: presentable.imageUrl)
        image.sd_setImage(with: url)
        name.text = presentable.name
    }
}
