//
//  ViewController.swift
//  YourLife
//
//  Created by Anna Melekhina on 03.01.2022.
//

import UIKit

//protocol LoginViewControllerDelegate {
//    func setDate()
//}

class FutureDaysViewController: UIViewController {

    @IBOutlet var todayLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var finishDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        todayLabel.text = "Today is\n \(getCurrentDate())"
        resultLabel.text = showFutureDays()

    }

private func getCurrentDate() -> String {
    let today =  Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yyyy"
    return formatter.string(from: today)
        
    }

private func showFutureDays() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"

    //insert here finishDate delegate
    let sampleDate = "22.12.2030"

    guard let finishDate = dateFormatter.date(from: sampleDate) else { return "" }
    guard let today = dateFormatter.date(from: getCurrentDate()) else { return "" }

    let daysTillDeath = Calendar.current.dateComponents([.day], from: today, to: finishDate)

    guard let days = daysTillDeath.day else {return ""}

    return "There are \(days) days till your death ☠️"


}
}

//MARK: delegate

//extension FutureDaysViewController: LoginViewControllerDelegate {
//func setDate() {
//    <#code#>
//}
//}

