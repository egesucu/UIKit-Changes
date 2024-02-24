//
//  WeatherView+Extension.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 11.02.2024.
//

import Foundation
import UIKit

typealias CollectionViewDelegate = UICollectionViewDataSource & UICollectionViewDelegateFlowLayout & UICollectionViewDelegate

extension WeatherViewController: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            case 0:
                mockWeatherBannerData.count
            default:
                mockWeatherData.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            case 0:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherBannerCollectionViewCell.cellIdentifier, for: indexPath) as? WeatherBannerCollectionViewCell else { return .init() }
                cell.banner = mockWeatherBannerData[indexPath.row]
                return cell
            default:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.cellIdentifier, for: indexPath) as? WeatherCollectionViewCell else { return .init() }
                cell.weather = mockWeatherData[indexPath.row]
                return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "Header" {
            guard let collection = collectionView
                .dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: WeatherHeaderView.identifier,
                    for: indexPath
                ) as? WeatherHeaderView else { return .init() }
            collection.section = indexPath.section
            return collection
        } else {
            return .init()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: self.view.frame.width, height: 60)
    }
    
    
}
