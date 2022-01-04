//
//  ViewController.swift
//  YourLife
//
//  Created by Roman on 01.01.2022.
//

import UIKit

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

// MARK: - UITextFielDelegate
extension FutureDaysViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        dateTextField.inputView = datePicker
//
//        datePicker.preferredDatePickerStyle = .inline
//        datePicker.datePickerMode = .date
//        datePicker.maximumDate = Date()
//
//        let calendarToolbar = UIToolbar()
//        calendarToolbar.sizeToFit()
//
//        let doneButton = UIBarButtonItem(
//            barButtonSystemItem: .done,
//            target: self,
//            action: #selector(didTapDone)
//        )
//
//        let flexBarButton = UIBarButtonItem(
//            barButtonSystemItem: .flexibleSpace,
//            target: nil,
//            action: nil
//        )
//
//        calendarToolbar.items = [flexBarButton, doneButton]
//        dateTextField.inputAccessoryView = calendarToolbar
//
//    }
    
}
