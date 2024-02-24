//
//  WeatherCollectionViewCell.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 11.02.2024.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "WeatherCollectionViewCell"
    
    var weather: Weather? {
        didSet {
            guard let weather else { return }
            bigTitleView.text = weather.day
            numberView.text = "\(weather.value)°"
            lineStackView.addArrangedSubview(bigTitleView)
            lineStackView.addArrangedSubview(numberView)
        }
    }
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray2
        return view
    }()
    
    lazy var lineStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }()
    
    let bigTitleView: UILabel = {
        let bigTitleView = UILabel()
        bigTitleView.font = .systemFont(ofSize: 30, weight: .bold)
        bigTitleView.textColor = .systemBlue
        bigTitleView.numberOfLines = 0
        bigTitleView.bounds = bigTitleView.frame.inset(
            by: .init(
                top: 0,
                left: 10,
                bottom: 0,
                right: 0
            )
        )
        return bigTitleView
    }()
    
    let numberView: UILabel = {
        let numberView = UILabel()
        numberView.font = .systemFont(ofSize: 24)
        numberView.numberOfLines = 0
        numberView.textColor = .systemGray2
        return numberView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        contentView.backgroundColor = .clear
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(lineStackView)
        mainStackView.addArrangedSubview(lineView)
        
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        topAnchor.constraint(equalTo: mainStackView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: -20).isActive = true
        bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor).isActive = true
    }
}
