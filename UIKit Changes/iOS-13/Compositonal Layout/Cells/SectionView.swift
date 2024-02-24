//
//  SectionView.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 11.02.2024.
//

import UIKit

class SectionView: UICollectionReusableView {
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        self.backgroundColor = .lightGray.withAlphaComponent(0.2)
        layer.cornerRadius = 20
    }
    
}
