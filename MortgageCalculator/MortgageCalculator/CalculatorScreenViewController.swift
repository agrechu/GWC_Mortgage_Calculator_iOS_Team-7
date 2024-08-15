//
//  CalculatorScreenViewController.swift
//  MortgageCalculator
//
//  Created by Andrea Calderon on 8/8/24.
//

import UIKit

class CalculatorScreenViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var listPriceLabel: UILabel!
    @IBOutlet weak var downPaymentTxtField: UITextField!
    @IBOutlet weak var loanPaymentTxtField: UITextField!
    @IBOutlet weak var loanDurationPickerview: UIPickerView!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var monthlyPaymentLabel: UILabel!
    
    let loanDurations = [15, 20, 30] // years
        var selectedLoanDuration = 30 // default value
        
        var listPrice: Double?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            loanDurationPickerview.dataSource = self
            loanDurationPickerview.delegate = self
            
            downPaymentTxtField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            loanPaymentTxtField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            
            if let price = listPrice {
                listPriceLabel.text = String(format: "%.2f", price)
            }
        }
        
        @IBAction func calculateButtonTapped(_ sender: UIButton) {
            calculateMortgage()
        }
        
        func calculateMortgage() {
            guard let listPrice = Double(listPriceLabel.text ?? "0"),
                  let downPayment = Double(downPaymentTxtField.text ?? "0"),
                  let loanPayment = Double(loanPaymentTxtField.text ?? "0") else {
                monthlyPaymentLabel.text = "Invalid input"
                return
            }
            
            let principal = listPrice - downPayment
            let interestRate = 0.0675 / 12 // monthly interest rate
            let numberOfPayments = Double(selectedLoanDuration * 12)
            
            let monthlyPayment = (principal * interestRate * pow(1 + interestRate, numberOfPayments)) / (pow(1 + interestRate, numberOfPayments) - 1)
            
            monthlyPaymentLabel.text = String(format: "Monthly Payment: $%.2f", monthlyPayment)
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            // You can add validation logic here if needed
        }
        
        // MARK: - UIPickerViewDataSource methods
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return loanDurations.count
        }
        
        // MARK: - UIPickerViewDelegate methods
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return "\(loanDurations[row]) years"
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedLoanDuration = loanDurations[row]
        }
    }
