//
//  LoginViewController.swift
//  YourLife
//
//  Created by Roman on 03.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var stepLabel: UILabel!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    
    @IBOutlet var birthdayDate: UITextField!
    @IBOutlet var finishDate: UITextField!
    
    @IBOutlet var progressView: UIProgressView!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var startButton: UIButton!
    
    private var steps = LoginSteps.takeAStep()
    private var currentStepIndex = 0
    
    let birthdayDatePicker = UIDatePicker()
    let finishDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        installBackgrounColor()
        
        nameTextField.delegate = self
        surnameTextField.delegate = self
        
        nameTextField.returnKeyType = .next
        
        birthdayDate.delegate = self
        finishDate.delegate = self
        
        addDoneButtonTo(surnameTextField, birthdayDate, finishDate)
       
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let demoVC = segue.destination as? DemoViewController else { return }
        demoVC.birthday = birthdayDate
        demoVC.finish = finishDate
        
    }
    
    @IBAction func nextButtonPressed() {
        getSecondScreen()

        
        
    }
    
    @IBAction func startButtonPressed() {
        guard let finishText = finishDate.text else { return }
        if finishText.isEmpty {
            showAlert(tittle: "Something went wrong", message: "Input correct information")
        } else {
            performSegue(withIdentifier: "demo2", sender: nil)
        }
        }


}
// MARK: - Privat Methods

extension LoginViewController {
    private func setupUI() {
        
        let currentStep =  steps[currentStepIndex]
        stepLabel.text = currentStep.steps.rawValue
        
        let totalProgress = Float(currentStepIndex) / Float(steps.count)
        progressView.setProgress(totalProgress, animated: true)
       
        
        
        showCurrentStep(for: currentStep.steps)
    }
    
    private func showCurrentStep(for title: Steps) {
        switch title {
        case .step1:
            applySettingsForFirstScreen()
        case .step2:
            applySettingsForSecondScreen()
        case .step3:
            applySettingsForThirdScreen()
        }
    }
    
    private func applySettingsForFirstScreen() {
        stepLabel.isHidden = false
        
        nameTextField.isHidden = false
        surnameTextField.isHidden = false
       
        birthdayDate.isHidden = true
        finishDate.isHidden = true
        
        startButton.isHidden = true
        
        title = "Знакомство"
    }
    
    private func applySettingsForSecondScreen() {
        stepLabel.isHidden = false
       
        nameTextField.isHidden = true
        surnameTextField.isHidden = true
        
        birthdayDate.isHidden = false
        finishDate.isHidden = true
        birthdayPicker()
        
        startButton.isHidden = true
        
        title = "Дата Рождения"

    }
    
    private func applySettingsForThirdScreen() {
        stepLabel.isHidden = false
      
        nameTextField.isHidden = true
        surnameTextField.isHidden = true
        
        birthdayDate.isHidden = true
        finishDate.isHidden = false
        finishPicker()
        
        startButton.isHidden = false
        nextButton.isHidden = true
        
        title = "Дата ухода"

    }
    
    
    private func getSecondScreen() {
        
        if currentStepIndex == 0 {
            guard let nameText = nameTextField.text else { return }
            guard let surnameText = surnameTextField.text else { return }
            if nameText.isEmpty {
                showAlert(tittle: "Something went wrong", message: "Input correct information")
            } else if surnameText.isEmpty {
                showAlert(tittle: "Something went wrong", message: "Input correct information")
            } else {
                currentStepIndex += 1
            }
            
        } else  {
            guard let birthdayText = birthdayDate.text else { return }
            if birthdayText.isEmpty {
                showAlert(tittle: "Something went wrong", message: "Input correct information")
            } else {
                currentStepIndex += 1
            }
        }

            
            
            if currentStepIndex < steps.count {
                setupUI()
                return
            } else {
                
            }
            
        }
    }



// MARK: - datePicker methods
extension LoginViewController: UITextFieldDelegate {
    private func birthdayPicker() {
        birthdayDate.inputView = birthdayDatePicker
        birthdayDatePicker.datePickerMode = .date
        birthdayDatePicker.preferredDatePickerStyle = .wheels
        
        let minimumYear = Calendar.current.date(byAdding: .year, value: -80, to: Date())
        let maximumYaer = Calendar.current.date(byAdding: .year, value: -5, to: Date())
        
        birthdayDatePicker.minimumDate = minimumYear
        birthdayDatePicker.maximumDate = maximumYaer
        
        birthdayDatePicker.addTarget(self, action: #selector(dateChangedBirth), for: .valueChanged)
    }
    
    @objc func dateChangedBirth() {
        getBirthDateFromPicker()
        }
    
    private func getBirthDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        birthdayDate.text = formatter.string(from: birthdayDatePicker.date)
    }
    
    private func finishPicker() {
        finishDate.inputView = finishDatePicker
        finishDatePicker.datePickerMode = .date
        finishDatePicker.preferredDatePickerStyle = .wheels
        
        let minimumYear = Calendar.current.date(byAdding: .year, value: 5, to: Date())
        let maximumYaer = Calendar.current.date(byAdding: .year, value: 120, to: Date())
        
        finishDatePicker.minimumDate = minimumYear
        finishDatePicker.maximumDate = maximumYaer
        
        finishDatePicker.addTarget(self, action: #selector(dateChangedFinish), for: .valueChanged)
    }

    @objc func dateChangedFinish() {
        getFinishDateFromPicker()
    }
   
    private func getFinishDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        finishDate.text = formatter.string(from: finishDatePicker.date)
    }
    
    private func addDoneButtonTo(_ textFields: UITextField...) {
           
           let numberToolbar = UIToolbar()
           numberToolbar.sizeToFit()
           textFields.forEach { textField in
               switch textField {
               case surnameTextField: textField.inputAccessoryView = numberToolbar
               case birthdayDate: textField.inputAccessoryView = numberToolbar
               case finishDate: textField.inputAccessoryView = numberToolbar
               default: break
               }
           }
           
           let doneButton = UIBarButtonItem(title:"Done",
                                            style: .done,
                                            target: self,
                                            action: #selector(tapDone))
           
           let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                               target: nil,
                                               action: nil)
           
           numberToolbar.items = [flexBarButton, doneButton]
           
       }
       
       @objc private func tapDone() {
           view.endEditing(true)
       }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
            super.touchesBegan(touches , with:event)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            surnameTextField.becomeFirstResponder()
        }
        return false
    }
    
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
            guard let newValue = textField.text else { return }
        if let _ = Float(newValue) {
            showAlert(tittle: "Something went wrong", message: "Input correct information")
            nameTextField.text = ""
            surnameTextField.text = ""
        }
        if let _ = Int(newValue) {
            showAlert(tittle: "Something went wrong", message: "Input correct information")
            nameTextField.text = ""
            surnameTextField.text = ""
        }
        }
}

// MARK: - Alerts

extension LoginViewController {
    private func showAlert(tittle: String, message: String) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)

        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

// MARK: - Design Methods

extension LoginViewController {
    
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
    
    
    
    
    
    

