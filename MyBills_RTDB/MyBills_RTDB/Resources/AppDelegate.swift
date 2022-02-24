//
//  AppDelegate.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/22/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //creating our window property to be of type UIWindow to be used below
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        
        //setting the device window size and bounds
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        //creating the story board as the value of a UIStoryboard named "Main"
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        //creating a variable called "vc" to be of type UIViewController to be used below
//        var vc: UIViewController
//        
//        if (UserDefaults.standard.value(forKey: "email") as? String) == nil {
//            // show the login screen if email is nil
//                //assigning the value of the vc(UIViewController) to be the instantiated VC called "login"
//            vc = storyboard.instantiateViewController(withIdentifier: "login")
//        } else {
//            //show the main screen
//            vc = storyboard.instantiateInitialViewController()!
//        }
//        
//        //setting the root view controller
//        self.window?.rootViewController = vc
//        //shows the window and makes it the key window
//        self.window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

