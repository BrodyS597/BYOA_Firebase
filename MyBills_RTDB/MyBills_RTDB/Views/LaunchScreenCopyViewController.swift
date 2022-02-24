////
////  LaunchScreenCopyViewController.swift
////  MyBills_RTDB
////
////  Created by Brody Sears on 2/23/22.
////
//
//import UIKit
//import FirebaseAuth
//import Firebase
//
//class LaunchScreenCopyViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        checkForCurrentUser()
//        // Do any additional setup after loading the view.
//    }
//
//    func checkForCurrentUser() {
////        if Auth.auth().currentUser != nil {
////            print(Auth.auth().currentUser?.uid)
////            segueToBillsList()
////        } else {
//        segueToLoginScreen()
////        }
//    }
//
//    func segueToBillsList() {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "navCon")
//        viewController.modalPresentationStyle = .overFullScreen
//        present(viewController, animated: true)
//    }
//
//    func segueToLoginScreen() {
//        performSegue(withIdentifier: "toLogin", sender: self)
////        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let viewController = storyboard.instantiateViewController(withIdentifier: "signUp")
////        viewController.modalPresentationStyle = .overFullScreen
//    }
//
//
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        // Get the new view controller using segue.destination.
////        // Pass the selected object to the new view controller.
////        print("it tried")
////    }
//
//
//}
