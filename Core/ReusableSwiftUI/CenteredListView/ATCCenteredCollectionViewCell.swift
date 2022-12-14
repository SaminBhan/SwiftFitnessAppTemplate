//
//  ATCCenteredCollectionViewCell.swift
//  FitnessApp
//
//  Created by Duy Bui on 1/13/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import UIKit
class ATCCenteredCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView?
    
    var imageName: String? {
        didSet {
            if let imageName = self.imageName, let image = UIImage(named: imageName) {
                if let imageView = imageView {
                    imageView.image = image
                } else {
                    let imageView = UIImageView(image: image)
                    self.addSubview(imageView)
                    // Add layout for subview
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
                    imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
                    imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
                    imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                    self.imageView = imageView
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.white
        contentView.frame.size.height = contentView.frame.size.width
        contentView.layer.cornerRadius = contentView.frame.size.width/2
        contentView.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
