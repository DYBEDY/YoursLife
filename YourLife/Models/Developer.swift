//
//  Developer.swift
//  YourLife
//
//  Created by Елисей Мищенко on 02.01.2022.
//

import Foundation

struct Developer {
    let fullName: String
    let work: String
    
    var title: String {
        "\(fullName) - \(work)"
    }
}

extension Developer {
    static func getDeveloperList() ->[Developer] {
        [
            Developer(fullName: "Diana Ovechkina", work: "Developer"),
            Developer(fullName: "Anna Mel", work: "Developer"),
            Developer(fullName: "Roma", work: "Developer"),
            Developer(fullName: "Elisei Mishchenko", work: "Developer")
        ]
    }
}
