//
//  makeAccountViewController.swift
//  MortgageCalculator
//
//  Created by Andrea Calderon on 8/8/24.
//

import UIKit
import Firebase
import FirebaseAuth

class makeAccountViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordText.isSecureTextEntry = true
        confirmText.isSecureTextEntry = true 
    }

    @IBAction func register(_ sender: Any) {
    
    // Guards for inputs; make sure user fills them in, otherwise do nothing
        guard let email = emailText.text, !email.isEmpty else {
            showAlert(message: "Please enter an email.")
            return
        }
        guard let password = passwordText.text, !password.isEmpty else {
            showAlert(message: "Please enter a password.")
            return
        }
        
        // Validate password strength
        if !isValidPassword(password) {
            showAlert(message: "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.")
            return
        }
        
        guard let confirm = confirmText.text, !confirm.isEmpty else {
            showAlert(message: "Please confirm your password.")
            return
        }
        // Check if passwords match
        if password != confirm {
         //   print("Passwords do not match.")
            showAlert(message: "Passwords do not match.")
            return
        }

        // Create user with Firebase Authentication
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("Error: \(e.localizedDescription)")
                self.showAlert(message: "Failed to create account: \(e.localizedDescription)")
            } else {
                // Go to login screen
                self.performSegue(withIdentifier: "goBack", sender: self)
            }
        }
    }
    // Function to display an alert to the user
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Function to validate password strength
    func isValidPassword(_ password: String) -> Bool {
        // Check length
        let lengthCriteria = password.count >= 8

        // Check for at least one uppercase letter, one lowercase letter, one number, and one special character
        let uppercaseLetter = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*")
        let lowercaseLetter = NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*")
        let digit = NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*")
        let specialCharacter = NSPredicate(format: "SELF MATCHES %@", ".*[!&^%$#@()/]+.*")

        return lengthCriteria &&
               uppercaseLetter.evaluate(with: password) &&
               lowercaseLetter.evaluate(with: password) &&
               digit.evaluate(with: password) &&
               specialCharacter.evaluate(with: password)
    }
}
