//
//  SignUpViewController.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/23/22.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    // MARK: -IBOutlets
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: -IBActions
    @IBAction func signUpButtonTapped(_ sender: Any) {
        if emailAddressTextField.text?.isEmpty == true {
            print("No text entered in email field")
            //AC option
            return
        }
        if passwordTextField.text?.isEmpty == true {
            print("No text entered in password field")
            //AC option
            return
        }
        signUp()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "login")
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func signUp() {
        // guard let email and pass
        guard let emailAddress = emailAddressTextField.text,
              let password = passwordTextField.text else { return }
        Auth.auth().createUser(withEmail: emailAddress, password: password) { authResult, error in
            if let error = error {
               print(error)
                return
            }
            guard let user = authResult?.user else {
                return
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "MyBillsList")
            viewController.modalPresentationStyle = .overFullScreen
            self.present(viewController, animated: true)
        }
    }
    
}
