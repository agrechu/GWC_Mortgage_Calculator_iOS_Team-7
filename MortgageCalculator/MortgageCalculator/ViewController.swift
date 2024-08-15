//
//  ViewController.swift
//  MortgageCalculator
//
//  Created by Christina Campbell on 7/8/24.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
   // @IBOutlet weak var login: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordText.isSecureTextEntry = true
    }

    @IBAction func login(_ sender: Any) {
    
        // Guards for inputs; make sure user fills them in, otherwise do nothing
        guard let email = userEmailText.text, !email.isEmpty else {
            showAlert(message: "Please enter an email.")
            return
        }
        guard let password = passwordText.text, !password.isEmpty else {
            showAlert(message: "Please enter a password.")
            return
        }

        // Create user with Firebase Authentication
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("Error: \(e.localizedDescription)")
                self.showAlert(message: "Failed to login. Wrong email and/or password.")
            } else {
                // Go to the next screen
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
    }
    // Function to display an alert to the user
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
