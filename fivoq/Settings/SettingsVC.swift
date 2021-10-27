//
//  SettingsVC
//  fivoq
//
//  Created by Brendan Saliba on 10/26/21.
//  Copyright © 2020 Brendan Saliba. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var allowDynamicColorScheme: UISwitch!
    @IBOutlet weak var autoCopyTextSwitch: UISwitch!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        allowDynamicColorScheme.addTarget(self, action: #selector(allowDynamicColorSchemeStateChanged), for: .valueChanged)
        autoCopyTextSwitch.addTarget(self, action: #selector(autoCopyTextStateChanged), for: .valueChanged)
        
        switch UserSettings.settings.allowDynamicColorScheme {
        case true:
            allowDynamicColorScheme.isOn = true
        case false:
            allowDynamicColorScheme.isOn = false
        }
        
        switch UserSettings.settings.autoCopyText {
        case true:
            autoCopyTextSwitch.isOn = true
        case false:
            autoCopyTextSwitch.isOn = false
        }
        
    }

    @objc func allowDynamicColorSchemeStateChanged(switchState: UISwitch) {
          if switchState.isOn {
              print("Allow dynamic")
              userDefaults.set(true, forKey: "allowDynamicColorScheme")
              UserSettings.settings.allowDynamicColorScheme = true
              
          } else {
              print("Allow dynamic mode")
              userDefaults.set(false, forKey: "allowDynamicColorScheme")
              UserSettings.settings.allowDynamicColorScheme = false
          }
      }
    
    @objc func autoCopyTextStateChanged(switchState: UISwitch) {
          if switchState.isOn {
              print("Auto copy text")
              userDefaults.set(true, forKey: "autoCopyText")
              UserSettings.settings.autoCopyText = true
          } else {
              print("Do not auto copy")
              userDefaults.set(false, forKey: "autoCopyText")
              UserSettings.settings.autoCopyText = false
          }
      }
    
    func forceLightMode() {
        if #available(iOS 13.0, *) {
            UIWindow.appearance().overrideUserInterfaceStyle = .light
            
        }
    }
    
    func dynamicLightMode() {
        if #available(iOS 13.0, *) {
            UIWindow.appearance().overrideUserInterfaceStyle = .unspecified
        }
    }
    
}
