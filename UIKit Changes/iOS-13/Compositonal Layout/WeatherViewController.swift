//
//  WeatherViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 11.02.2024.
//

import UIKit

class WeatherViewController: UIViewController {
    
    lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: .init()
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            WeatherBannerCollectionViewCell.self,
            forCellWithReuseIdentifier: WeatherBannerCollectionViewCell.cellIdentifier
        )
        collectionView.register(
            WeatherCollectionViewCell.self,
            forCellWithReuseIdentifier: WeatherCollectionViewCell.cellIdentifier
        )
        collectionView.register(
            WeatherHeaderView.self,
            forSupplementaryViewOfKind: "Header",
            withReuseIdentifier: WeatherHeaderView.identifier
        )
        collectionView.backgroundColor = .systemGroupedBackground
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        setUpConstrains()
        configureCompositeLayout()
    }
    
    func setUpConstrains(){
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension WeatherViewController {
    func configureCompositeLayout() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            return switch sectionIndex {
                case 0:
                    ApplicationLayout.shared.largeSlideSection()
                default:
                    ApplicationLayout.shared.listSlideSection()
            }
        }
        layout.register(SectionView.self, forDecorationViewOfKind: "SectionBackground")
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}
