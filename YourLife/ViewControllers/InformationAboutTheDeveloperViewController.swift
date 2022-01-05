//
//  InformationAboutTheDeveloperViewController.swift
//  YourLife
//
//  Created by Елисей Мищенко on 02.01.2022.
//

import UIKit

class InformationAboutTheDeveloperViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var developerImage: UIImageView!
    @IBOutlet weak var youLivedLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    //MARK: - Public properties
    var developer: Developer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        developerImage.layer.cornerRadius = 20
        developerImage.image = UIImage(named: developer.title)
        dateOfBirthLabel.text = developer.dateOfBirth
        youLivedLabel.text = dateInterval(beginDate: developer.dateOfBirth, endDate: getCurrentDate())
    }
    
    //MARK: - Private methods
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
        
        let resultDateInterval = " \(days) days"
        
        return resultDateInterval
    }
}




    



    

