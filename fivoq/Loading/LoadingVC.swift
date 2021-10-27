//
//  LoadingVC
//  fivoq
//
//  Created by Brendan Saliba on 10/21/21.
//  Copyright © 2020 Brendan Saliba. All rights reserved.
//

import Foundation
import UIKit

class LoadingVC: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sleep(2)
        checkNewUser()
    }
    
    
    // MARK: Utility
    
    func checkNewUser() {
        if UserDefaults.standard.valueExists(forKey: "UserIsNew") {
            
            switch UserDefaults.standard.bool(forKey: "UserIsNew") {
            case true:
                // new user
                DispatchQueue.main.async {
                    self.showInstructions()
                }
                
            case false:
                // returning user
                DispatchQueue.main.async {
                    self.showMain()
                }
            }

        } else {
            DispatchQueue.main.async {
                UserDefaults.standard.set(true, forKey: "UserIsNew")
                self.showInstructions()
            }
        }
    }
    
    
    // MARK: Navigation
    
    func showMain() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyBoard.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.modalTransitionStyle = .crossDissolve
        self.present(mainVC, animated: true, completion: nil)
    }
    
    func showInstructions() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let instructionsVC = storyBoard.instantiateViewController(withIdentifier: "InstructionsVC") as! InstructionsVC
        instructionsVC.modalPresentationStyle = .fullScreen
        instructionsVC.modalTransitionStyle = .crossDissolve
        self.present(instructionsVC, animated: true, completion: nil)
    }

}
