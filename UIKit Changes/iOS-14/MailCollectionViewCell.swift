//
//  MailCollectionViewCell.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 12.02.2024.
//

import UIKit

@available(iOS 14, *)
class MailCollectionViewCell: UICollectionViewCell {
    
    let roundedView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 200, height: 200))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        return view
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.numberOfLines = 0
        return label
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
        addSubview(roundedView)
        
        centerXAnchor.constraint(equalTo: roundedView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: roundedView.centerYAnchor).isActive = true
        roundedView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        roundedView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        roundedView.addSubview(horizontalStackView)
        
        horizontalStackView.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 10).isActive = true
        horizontalStackView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 10).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -10).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -10).isActive = true
        
        horizontalStackView.addArrangedSubview(mainStackView)
        horizontalStackView.addArrangedSubview(UIView(frame: .zero))
        horizontalStackView.addArrangedSubview(countLabel)
        
        mainStackView.addArrangedSubview(iconView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(UIView())
        
        iconView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
