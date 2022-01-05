//
//  DemoViewController.swift
//  YourLife
//
//  Created by Roman on 04.01.2022.
//

import UIKit

class DemoViewController: UIViewController {
    @IBOutlet var first: UILabel!
    
    @IBOutlet var second: UILabel!
    
    var birthday: UITextField!
    var finish: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        first.text = birthday.text
        second.text = finish.text
        print("i)
    }
    


}
