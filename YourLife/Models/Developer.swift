//
//  Developer.swift
//  YourLife
//
//  Created by Елисей Мищенко on 02.01.2022.
//

import Foundation

let calendar = Calendar.current

struct Developer {
    let fullName: String
    let work: String
    let dateOfBirth: String
    
    var title: String {
        "\(fullName) - \(work)"
    }
}

extension Developer {
    static func getDeveloperList() -> [Developer] {
        [
            Developer(fullName: "Diana Ovechkina",
                      work: "Developer",
                      dateOfBirth: "07.03.2001"),
            Developer(fullName: "Anna Mel",
                      work: "Developer",
                      dateOfBirth: "05.09.1992"),
            Developer(fullName: "Roma",
                      work: "Developer",
                      dateOfBirth: "10.05.1994"),
           Developer(fullName: "Elisei Mishchenko",
                     work: "Developer",
                     dateOfBirth: "10.10.2007")
        ]
    }
}
