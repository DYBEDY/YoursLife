//
//  InformationAboutTheDeveloperViewController.swift
//  YourLife
//
//  Created by Елисей Мищенко on 02.01.2022.
//

import UIKit

class InformationAboutTheDeveloperViewController: UIViewController {
    
    @IBOutlet weak var developerImage: UIImageView!
    @IBOutlet weak var youLivedLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    var developer: Developer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        developerImage.layer.cornerRadius = 20
        developerImage.image = UIImage(named: developer.title)
        dateOfBirthLabel.text = "Date of birth \(developer.dateOfBirth)"
    }
    
   
}
