//
//  VersionCollectionViewCell.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 4.02.2024.
//

import UIKit

class VersionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var customView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCustomView()
    }
    
    private func setCustomView() {
        customView.layer.cornerRadius = 10
        customView.backgroundColor = .black.withAlphaComponent(0.3)
    }
    
    func configure(with version: Version) {
        
        if let image = version.image {
            iconView.image = image
        }
        titleLabel.text = version.name
    }
}
