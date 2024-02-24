//
//  Mail.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 12.02.2024.
//

import Foundation
import UIKit.UIImage
import UIKit.UIColor

struct Mail {
    let iconName: String
    let title: String
    let count: Int
    let tintColor: UIColor
    
    var icon: UIImage? {
        UIImage(systemName: iconName)
    }
}

let mockMailData: [Mail] = [
    Mail(
        iconName: "tray.circle.fill",
        title: "Unread",
        count: 12,
        tintColor: .systemBlue
    ),
    Mail(
        iconName: "clock.fill",
        title: "Remind Me",
        count: 2,
        tintColor: .systemGreen
    ),
    Mail(
        iconName: "doc.circle.fill",
        title: "Drafts",
        count: 20,
        tintColor: .systemRed
    ),
    Mail(
        iconName: "trash.circle.fill",
        title: "Trash",
        count: 99,
        tintColor: .systemBlue
    )
]
