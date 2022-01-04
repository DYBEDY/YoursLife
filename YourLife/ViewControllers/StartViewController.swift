//
//  ViewController.swift
//  YourLife
//
//  Created by Roman on 01.01.2022.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        installBackgrounColor()
    }


}

// MARK: - Design Methods

extension StartViewController {
    
    private func installBackgrounColor() {
        let gradientLayer = CAGradientLayer()
               gradientLayer.frame = view.bounds
               gradientLayer.colors = [
                UIColor.white.cgColor,
                   UIColor.systemIndigo.cgColor
               ]
               view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
