//
//  LoginViewController.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/23/22.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: -IBOutlets
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }
    
    // MARK: -IBActions
    @IBAction func loginButtonTapped(_ sender: Any) {
        validateFields()
        
        if let emailAddress = emailAddressTextField.text, !emailAddress.isEmpty,
           let password = passwordTextField.text, !password.isEmpty {
            Auth.auth().signIn(withEmail: emailAddress, password: password) { result, error in
                switch result {
                case .none:
                    let alertController = UIAlertController(title: "No account found", message: "Check your username and password", preferredStyle: .alert)
                    let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alertController.addAction(confirmAction)
                    self.present(alertController, animated: true, completion: nil)
                case .some(let userDetails):
                    print("Welcome back!", userDetails.user.email!)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let navigationController = storyboard.instantiateViewController(withIdentifier: "navCon") as? UINavigationController
                    let listViewController = navigationController?.viewControllers[0] as? ListTableViewController
                    navigationController?.modalPresentationStyle = .overFullScreen
                    self.present(navigationController!, animated: true)
                }
            }
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "signUp")
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true)
    }
    
    func validateFields() -> Bool {
        return emailAddressTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
    }
    
    //    func login() {
    //        guard let emailAddress = emailAddressTextField.text,
    //              let password = passwordTextField.text else { return }
    //        Auth.auth().signIn(withEmail: emailAddress, password: password) { [weak self] authResult, error in
    //            guard let strongSelf = self else { return }
    //            if let error = error {
    //                print(error.localizedDescription)
    //            }
    //            strongSelf.segueToBillsList()
    //        }
    //    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "navCon")
            viewController.modalPresentationStyle = .overFullScreen
            present(viewController, animated: true)
        }
    }
    
    func segueToBillsList() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "navCon")
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true)
    }
}
