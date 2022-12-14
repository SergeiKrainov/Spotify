//
//  AppDelegate.swift
//  Spotify
//
//  Created by Sergey on 03.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        if #available(iOS 15.0, *) {
//                  let navigationBarAppearance = UINavigationBarAppearance()
//                  navigationBarAppearance.configureWithDefaultBackground()
//                  UINavigationBar.appearance().standardAppearance = navigationBarAppearance
//                  UINavigationBar.appearance().compactAppearance = navigationBarAppearance
//                  UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
//              }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        if AuthManager.shared.isSignIn {
            window.rootViewController = TabBarViewController()
        }
        else {
            let navVc = UINavigationController(rootViewController: WelcomeViewController())
            navVc.navigationBar.prefersLargeTitles = true
            navVc.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
            window.rootViewController = navVc
        }
        
        window.makeKeyAndVisible()
        self.window = window
        
        UITabBar.appearance().backgroundColor = .secondarySystemBackground
        
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

