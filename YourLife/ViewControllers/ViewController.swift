//
//  ViewController.swift
//  YourLife
//
//  Created by Roman on 01.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dateTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        toolbar.items = [flexBarButton, doneButton]

        
        dateTextField.inputAccessoryView = toolbar
        
    }
    
    @objc private func didTapDone() {
        getDateFromPicker()
        view.endEditing(true)
    }

    func getDateFromPicker() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
    }

}

