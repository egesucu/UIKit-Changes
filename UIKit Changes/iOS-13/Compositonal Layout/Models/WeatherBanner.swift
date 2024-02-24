//
//  WeatherBanner.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 11.02.2024.
//

import Foundation
import UIKit.UIImage

struct WeatherBanner {
    let index: Int
    let imageName: String
    
    var image: UIImage? {
        UIImage(named: imageName)
    }
}

let mockWeatherBannerData: [WeatherBanner] = [
    WeatherBanner(index: 0, imageName: "rainingBanner"),
    WeatherBanner(index: 1, imageName: "sunnyBanner"),
    WeatherBanner(index: 2, imageName: "thunderBanner")
]
