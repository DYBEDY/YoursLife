//
//  ViewController.swift
//  YourLife
//
//  Created by Roman on 01.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var todayLabel: UILabel!
    @IBOutlet var passedDaysLabel: UILabel!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldDidBeginEditing(dateTextField)
    
        todayLabel.text = "Today is " + getCurrentDate()
        passedDaysLabel.isHidden = true
        
    
    }
    
    // MARK: - private methods
    
    @objc private func didTapDone() {
        dateTextField.text = getDateOfBirth()
        
        passedDaysLabel.isHidden = false
        passedDaysLabel.text = "You have lived for " + dateInterval(beginDate: getDateOfBirth(),
                                            endDate: getCurrentDate())
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
        
        let dateInterval = Calendar.current.dateComponents([.year, .month, .day], from: begin, to: end)
        
        guard let years = dateInterval.year else {return ""}
        guard let monthes = dateInterval.month else {return ""}
        guard let days = dateInterval.day else {return ""}
        
        let resultDateInterval = "Years: \(years), Monthes: \(monthes), Days: \(days)"
        
        return resultDateInterval
    }

}

// MARK: - UITextFielDelegate

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        dateTextField.inputView = datePicker
        
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        
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
    
}

