//
//  DataManager.swift
//  YourLife
//
//  Created by Елисей Мищенко on 04.01.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    let names = [
        "Kevin", "Lori", "Keith", "Peter",
        "Jennie", "Albert", "Paul", "Laura",
        "Steven", "Rita"
    ]
    
    let surname = [
        "Roberts", "Curtis", "Fisher", "Smith",
        "King", "Lewis", "Stanley", "Clark",
        "Caldwell", "Gibson"
    ]
    
    let dateOfBirth = [
        "06.07.1995", "12.09.2003", "19.11.2010", "30.08.2004",
        "29.10.2005", "11.09.2006", "24.04.2001", "12.08.2003",
        "25.06.2004", "01.12.1992"
    ]
}
