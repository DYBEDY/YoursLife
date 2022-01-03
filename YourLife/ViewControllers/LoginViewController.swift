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
    
    @IBOutlet var birthdayDatePicker: UIDatePicker!
    @IBOutlet var finishDatePicker: UIDatePicker!
    
    @IBOutlet var progressView: UIProgressView!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var startButton: UIButton!
    
    private var steps = LoginSteps.takeAStep()
    private var currentStepIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       
    }
    @IBAction func nextButtonPressed() {
        getSecondScreen()
        
    }
    
    @IBAction func startButtonPressed() {
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
       
        birthdayDatePicker.isHidden = true
        finishDatePicker.isHidden = true
        
        startButton.isHidden = true
        
        title = "Знакомство"

    }
    
    private func applySettingsForSecondScreen() {
        stepLabel.isHidden = false
       
        nameTextField.isHidden = true
        surnameTextField.isHidden = true
        
        birthdayDatePicker.isHidden =  false
        finishDatePicker.isHidden = true
        
        startButton.isHidden = true
        
        title = "Дата Рождения"

    }
    
    private func applySettingsForThirdScreen() {
        stepLabel.isHidden = false
      
        nameTextField.isHidden = true
        surnameTextField.isHidden = true
        
        birthdayDatePicker.isHidden = true
        finishDatePicker.isHidden = false
        
        startButton.isHidden = false
        nextButton.isHidden = true
        
        title = "Дата ухода"

    }
    
    
    private func getSecondScreen() {
        currentStepIndex += 1
        
        if currentStepIndex < steps.count {
            setupUI()
            return
        } else {
            
        }
        
    }
    
    private func birthdayDatePickerSettings() {
       
        
        
    }
    
}

