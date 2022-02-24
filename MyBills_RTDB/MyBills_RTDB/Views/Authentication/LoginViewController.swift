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
    
    
    
    // MARK: -IBActions
    @IBAction func loginButtonTapped(_ sender: Any) {
//        if validateFields() {
//        } else {
//            print("Fields are empty")
//        }
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
                    let storyboard = UIStoryboard(name: "MyBillsList", bundle: nil)
                    let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
                    let HomePageViewModel = ListTVCModel(userID: userDetails.user.uid)
                    let homePageViewController = navigationController?.viewControllers[0] as? ListTableViewController
                    homePageViewController?.viewModel = HomePageViewModel
                    navigationController?.modalPresentationStyle = .fullScreen
                    self.present(navigationController!, animated: true, completion: nil)
                    
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
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func validateFields() -> Bool {
        return emailAddressTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
    }
    
    func login() {
        guard let emailAddress = emailAddressTextField.text,
              let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: emailAddress, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                print(error.localizedDescription)
            }
            strongSelf.segueToBillsList()
        }
    }
    
    func segueToBillsList() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "navCon")
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true)
    }
}
