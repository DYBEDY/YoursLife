//
//  ViewController.swift
//  YourLife
//
//  Created by Roman on 01.01.2022.
//

import UIKit

class DaysLivedViewController: UIViewController {

    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var todayLabel: UILabel!
    @IBOutlet var passedDaysLabel: UILabel!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldDidBeginEditing(dateTextField)
        
        todayLabel.text = "Today is\n \(getCurrentDate())"
        
        passedDaysLabel.isHidden = true
        passedDaysLabel.layer.cornerRadius = 15
        passedDaysLabel.layer.masksToBounds = true
    }
    
    // MARK: - private methods
    
    @objc private func didTapDone() {
        dateTextField.text = getDateOfBirth()
        
        passedDaysLabel.isHidden = false
        passedDaysLabel.layer.cornerRadius = 15
        passedDaysLabel.text = "\nYou have lived for\n \(dateInterval(beginDate:getDateOfBirth(), endDate: getCurrentDate()))\n"
        view.endEditing(true)
    }

   private func getDateOfBirth() -> String {
        let dateOfBirth = DateFormatter()
        dateOfBirth.dateFormat = "dd.MM.yyyy"
        
        return dateOfBirth.string(from: datePicker.date)
    }
    
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

// MARK: - UITextFielDelegate

extension DaysLivedViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        dateTextField.inputView = datePicker
        
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        
        let calendarToolbar = UIToolbar()
        calendarToolbar.sizeToFit()
        
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
        
        calendarToolbar.items = [flexBarButton, doneButton]
        dateTextField.inputAccessoryView = calendarToolbar
        
    }
    
}

