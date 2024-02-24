//
//  ApplicationLayout.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 11.02.2024.
//

import Foundation
import UIKit

class ApplicationLayout {
    static let shared = ApplicationLayout()
    
    func largeSlideSection() -> NSCollectionLayoutSection {
        
        let contextDimension = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let context = NSCollectionLayoutItem(layoutSize: contextDimension)
        
        let groupDimension = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(240))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupDimension, subitems: [context])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.boundarySupplementaryItems = [
            .init(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(40)
                ),
                elementKind: "Header",
                alignment: .top
            )
        ]

        return section
    }
    
    func listSlideSection() -> NSCollectionLayoutSection {
        let contextDimension = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let context = NSCollectionLayoutItem(layoutSize: contextDimension)
        
        let groupDimension = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupDimension, subitems: [context])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.boundarySupplementaryItems = [
            .init(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(40)
                ),
                elementKind: "Header",
                alignment: .top
            )
        ]
        
        return section
    }
}
