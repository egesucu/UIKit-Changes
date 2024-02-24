//
//  Version.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 4.02.2024.
//

import Foundation
import UIKit.UIImage

// MARK: - Definition
struct Version: Equatable {
    let name: String
    let imageName: String
    
    var image: UIImage? {
        UIImage(named: imageName)
    }
    
}

// MARK: - Static Variables
extension Version {
    static let iOS13 = Version(name: "iOS 13", imageName: "ios13")
    static let iOS14 = Version(name: "iOS 14", imageName: "ios14")
    static let iOS15 = Version(name: "iOS 15", imageName: "ios15")
    static let iOS16 = Version(name: "iOS 16", imageName: "ios16")
    static let iOS17 = Version(name: "iOS 17", imageName: "ios17")
}

// MARK: - Identifiable
extension Version: Identifiable {
    var id: String {
        imageName
    }
}
