//
//  Users.swift
//  YourLife
//
//  Created by Елисей Мищенко on 05.01.2022.
//

import Foundation

struct User {
    let name: String
    let surname: String
    let dateOfBirth: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension User {
    static func getUsersList() -> [User] {
        var users: [User] = []
        
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surname.shuffled()
        let datesOfBirth = DataManager.shared.dateOfBirth.shuffled()
        
        for index in 0..<names.count {
            let user = User(
                name: names[index],
                surname: surnames[index],
                dateOfBirth: datesOfBirth[index]
            )
            users.append(user)
        }
        return users
    }
}
