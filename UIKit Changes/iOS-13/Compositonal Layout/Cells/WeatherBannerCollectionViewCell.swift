//
//  WeatherBannerCollectionViewCell.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 11.02.2024.
//

import UIKit

class WeatherBannerCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "WeatherBannerCollectionViewCell"
    
    var banner: WeatherBanner? {
        didSet {
            guard let banner else { return }
            bannerImageView.image = banner.image
        }
    }
    
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemBackground
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        contentView.backgroundColor = .clear
        addSubview(bannerImageView)
        
        topAnchor.constraint(equalTo: bannerImageView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: bannerImageView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: bannerImageView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: bannerImageView.trailingAnchor).isActive = true
    }
    
}
