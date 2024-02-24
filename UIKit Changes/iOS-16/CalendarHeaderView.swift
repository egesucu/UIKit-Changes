//
//  CalendarHeaderView.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 24.02.2024.
//

import UIKit

@available(iOS 16, *)
protocol CalendarHeaderViewProtocol: AnyObject {
    func buttonPressed()
}

@available(iOS 16, *)
class CalendarHeaderView: UICollectionReusableView {
    static let identifier = "CalendarHeaderView"
    
    weak var viewDelegate: CalendarHeaderViewProtocol?
    
    private lazy var headerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Lorem Ipsum View", for: .normal)
        button.addAction(.init { [weak self] _ in
            self?.viewDelegate?.buttonPressed()
        }, for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}



