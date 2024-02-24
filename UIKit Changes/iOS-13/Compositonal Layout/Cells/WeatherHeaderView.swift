//
//  WeatherHeaderView.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 11.02.2024.
//

import UIKit

class WeatherHeaderView: UICollectionReusableView {
    static let identifier = "WeatherHeaderView"
    
    var section: Int = 0 {
        didSet {
            switch section {
                case 0:
                    titleLabel.text = "Notifications"
                default:
                    titleLabel.text = "Weather"
            }
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUpConstrains(){
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGroupedBackground
        addSubview(titleLabel)
        setUpConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
