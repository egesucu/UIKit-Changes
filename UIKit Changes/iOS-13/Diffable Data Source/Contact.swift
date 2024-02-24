//
//  Contact.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 10.02.2024.
//

import Foundation

struct Contact: Hashable, Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    static let fakeDataArray: [Contact] = [
        Contact(firstName: "Ege", lastName: "Sucu"),
        Contact(firstName: "Anıl", lastName: "Taşkıran"),
        Contact(firstName: "Fatih Kadir", lastName: "Akın")
    ]
    
    static let fakeAppendingArray: [Contact] = [
        Contact(firstName: "Onur", lastName: "Aslan"),
        Contact(firstName: "Furkan", lastName: "Cingöz"),
        Contact(firstName: "Burkan", lastName: "Yılmaz"),
        Contact(firstName: "Altuğ", lastName: "Akgül")
    ]
}

enum Section {
    case favorites
}
