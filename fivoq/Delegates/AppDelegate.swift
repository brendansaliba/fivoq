//
//  AppDelegate
//  fivoq
//
//  Created by Brendan Saliba on 10/21/21.
//  Copyright © 2020 Brendan Saliba. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Set default user settings if they dont' exist
        getDefaultSettings()
        
        return true
    }
    
    func getDefaultSettings() {
        let userDefaults = UserDefaults.standard
        
        if !userDefaults.valueExists(forKey: "allowDynamicColorScheme") {
            userDefaults.set(true, forKey: "allowDynamicColorScheme")
        } else {
            UserSettings.settings.allowDynamicColorScheme = userDefaults.bool(forKey: "allowDynamicColorScheme")
        }
        
        if !userDefaults.valueExists(forKey: "autoCopyText") {
            userDefaults.set(true, forKey: "autoCopyText")
        } else {
            UserSettings.settings.autoCopyText = userDefaults.bool(forKey: "autoCopyText")
        }
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

