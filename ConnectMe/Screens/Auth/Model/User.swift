//
//  User.swift
//  ConnectMe
//
//  Created by Yogesh Rathore on 16/12/24.
//

import Foundation


struct User: Codable {
    let uid: String
    let email: String
    let fullName: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let component = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: component)
        }
        return ""
    }
}
