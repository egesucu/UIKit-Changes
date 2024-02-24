//
//  CollectionViewResizedViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 24.02.2024.
//

import UIKit
import LoremIpsum

@available(iOS 16, *)
class CollectionViewResizedViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()

    }
    
    private func configureCollectionView() {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(34))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [header]
            
            return section
        }
        collectionView.selfSizingInvalidation = .enabled
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
        collectionView.register(CalendarHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CalendarHeaderView.identifier)
    }

}

@available(iOS 16, *)
extension CollectionViewResizedViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as? CalendarCollectionViewCell else {
            return .init()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CalendarHeaderView.identifier, for: indexPath) as? CalendarHeaderView {
            headerView.viewDelegate = self
            return headerView
        } else {
            return .init()
        }
    }
}

@available(iOS 16, *)
extension CollectionViewResizedViewController: CalendarHeaderViewProtocol {
    func buttonPressed() {
        let randomLabelView = UILabel()
        randomLabelView.text = .loremIpsum(paragraphs: 1)
        randomLabelView.numberOfLines = 0
        randomLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBackground
        viewController.view.addSubview(randomLabelView)
        NSLayoutConstraint.activate(
            [
                randomLabelView.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 10),
                randomLabelView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: -10),
                randomLabelView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: 10),
                randomLabelView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: -10)
            ]
        )
        viewController.modalPresentationStyle = .pageSheet
        
        let sheet = viewController.sheetPresentationController
        sheet?.preferredCornerRadius = 10
        sheet?.prefersGrabberVisible = true
        let fixedHeightID = UISheetPresentationController.Detent.Identifier("fixedHeight")
        let fixedHeight = UISheetPresentationController.Detent.custom(
            identifier: fixedHeightID) { _ in
                150
            }
        
        let percentagedHeightID = UISheetPresentationController.Detent.Identifier("percentagedHeight")
        let percentagedHeight = UISheetPresentationController.Detent.custom(
            identifier: percentagedHeightID) { context in
                0.4 * context.maximumDetentValue
            }
        
        sheet?.detents = [fixedHeight, percentagedHeight, .medium(), .large()]
        present(viewController, animated: true)
        
    }
    
}
