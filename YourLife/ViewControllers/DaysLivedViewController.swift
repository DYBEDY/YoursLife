//
//  ViewController.swift
//  YourLife
//
//  Created by Roman on 01.01.2022.
//

import UIKit

class DaysLivedViewController: UIViewController {

    @IBOutlet var todayLabel: UILabel!
    @IBOutlet var passedDaysLabel: UILabel!
    
    var birthDate = "07.03.2001"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todayLabel.text = "Сегодня\n \(getCurrentDate())"
        
        passedDaysLabel.layer.cornerRadius = 15
        passedDaysLabel.layer.masksToBounds = true
        passedDaysLabel.text = "\n Ты прожил уже \n \(dateInterval(beginDate: birthDate, endDate: getCurrentDate()))\n"
    }
    
    // MARK: - private methods
    
   private func getCurrentDate() -> String {
        let currentDate = DateFormatter()
        currentDate.dateFormat = "dd.MM.yyyy"
        
        return currentDate.string(from: Date())
    }
    
    
   private func dateInterval(beginDate: String, endDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        guard let begin = dateFormatter.date(from: beginDate) else { return "" }
        guard let end = dateFormatter.date(from: endDate) else { return "" }
        
        let dateInterval = Calendar.current.dateComponents([.day], from: begin, to: end)
        
        guard let days = dateInterval.day else {return ""}
        
        let resultDateInterval = " \(days) дней"
            
        return resultDateInterval
    }

}


