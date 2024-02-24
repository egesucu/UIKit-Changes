//
//  SwiftUICellViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 24.02.2024.
//

import UIKit
import SwiftUI

@available(iOS 16, *)
class SwiftUICellViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<String, Customer>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollection()
        populateData()

        collectionView.setCollectionViewLayout(setupCollectionViewLayout(), animated: true)
        
    }
    
    private func configureCollection() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, Customer> { cell,indexPath,customer in
            cell.contentConfiguration = UIHostingConfiguration {
                CustomerCellView(customer: customer)
            }
        }
        
        dataSource = UICollectionViewDiffableDataSource<String, Customer>(collectionView: collectionView) { collectionView, indexPath, customer in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: customer)
            return cell
        }
    }
    
    private func populateData() {
        var snapshot = NSDiffableDataSourceSnapshot<String, Customer>()
        snapshot.appendSections(["Main"])
        snapshot.appendItems(mockupCustomerModel, toSection: "Main")
        dataSource?.apply(snapshot)
    }
    
    private func setupCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { _, environment -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(60))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [item])
            
            group.interItemSpacing = .fixed(70)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 40, leading: 10, bottom: 10, trailing: 10)
            
            section.interGroupSpacing = 70
            
            return section
            
        }
        return layout
    }
    

}


struct Customer: Hashable {
    let name: String
    let surname: String
    let iOSVersionName: String
    
    var fullName: String {
        name + " " + surname
    }
    
    var iOSVersion: UIImage? {
        UIImage(named: iOSVersionName)
    }
}

let mockupCustomerModel: [Customer] = [
    Customer(name: "Ege", surname: "Sucu", iOSVersionName: "ios17"),
    Customer(name: "Fatih Kadir", surname: "Akın", iOSVersionName: "ios15"),
    Customer(name: "Fatih", surname: "Sezgin", iOSVersionName: "ios14"),
    Customer(name: "Ömer", surname: "Ural", iOSVersionName: "ios16")
]


@available(iOS 16, *)
struct CustomerCellView: View {
    
    var customer: Customer
    
    var body: some View {
        VStack {
            HStack {
                Text("Customer Name:")
                    .font(.title3)
                Text(customer.fullName)
            }
            if let version = customer.iOSVersion {
                HStack {
                    Text("OS Version:")
                        .font(.title3)
                    Image(uiImage: version)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .accessibilityIdentifier(customer.iOSVersionName)
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.4).clipShape(.capsule).shadow(radius: 6))
    }
    
}
