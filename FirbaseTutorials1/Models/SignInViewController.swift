//
//  SignInViewController.swift
//  FirbaseTutorials1
//
//  Created by Mostafa AbdEl Fatah on 10/31/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
  
    override func viewDidLoad() {
        FirebaseAuth.authChanged { (auth, user) in
            // if authenticated go to main view controller
            print("authentication changed: Start main view controller")
            if user != nil {
                let mainStoryboard = UIStoryboard(name: "Main", bundle:Bundle.main)
                let vc  = mainStoryboard.instantiateViewController(withIdentifier: "mainvc")
                self.present(vc, animated: true, completion: nil)
            }
        }
    }

    
    @IBAction func signInDidTapped(_ sender: UIButton) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text
            else {return}
        FirebaseAuth.signIn(email: email, password: password){ (message) in
            self.showAlert(title: "Sign In Error", message: message)
        }
    }
    
 
}
