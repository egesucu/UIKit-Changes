//
//  CalendarCollectionViewCell.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 24.02.2024.
//

import UIKit
import EventKit
import LoremIpsum

@available(iOS 16, *)
class CalendarCollectionViewCell: UICollectionViewCell {
    
    private let calendarView: UICalendarView = {
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        return calendarView
    }()
    
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    static let identifier = "CalendarCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        
        calendarView.selectionBehavior = UICalendarSelectionSingleDate(delegate: self)
        contentView.addSubview(calendarView)
        contentView.addSubview(dateLabel)
        
        
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            calendarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 380),
            dateLabel.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 30),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 16, *)
extension CalendarCollectionViewCell: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        guard let dateComponents,
            let date = Calendar.current.date(from: dateComponents) else { return }
        let formattedDate = date.formatted(.dateTime.weekday(.wide).day().month(.wide).year())
        dateLabel.text = "Selected Date is: \(formattedDate)" + "\n\n\n" + String.loremIpsum(paragraphs: 2)
        UIView.performWithoutAnimation { [weak self] in
            self?.invalidateIntrinsicContentSize()
        }
        
    }
}
