//
//  MainVC
//  fivoq
//
//  Created by Brendan Saliba on 10/21/21.
//  Copyright © 2020 Brendan Saliba. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureMenu()
        checkNewUser()
    }
    
    func configure() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        outputTextView.text = ""
        outputTextView.isEditable = false
        outputTextView.isScrollEnabled = false
        outputTextView.isSelectable = true
    }
    
    func configureMenu() {
        let visitAction: UIAction = UIAction(title: "Visit Us", image: UIImage(systemName: "safari")) { (_) in
            self.visitWebsite()
        }
        let instructionsAction: UIAction = UIAction(title: "View Instructions", image: UIImage(systemName: "info.circle")) { (_) in
            self.showInstructions()
        }
        let settingsAction: UIAction = UIAction(title: "Settings", image: UIImage(systemName: "gear")) { (_) in
            self.showSettings()
        }
        
        let menu = UIMenu(title: "", children: [
            visitAction,
            instructionsAction,
            settingsAction
        ])

        menuButton.showsMenuAsPrimaryAction = true
        menuButton.menu = menu
    }
    
    func checkNewUser() {
        if UserDefaults.standard.valueExists(forKey: "UserIsNew") {
            // the user is not new
            
            switch UserDefaults.standard.bool(forKey: "UserIsNew") {
            case true:
                // new user
                DispatchQueue.main.async {
                    self.showInstructions()
                }
                
            case false:
                // returning user
                print("Returning user")
            }

        } else {
            DispatchQueue.main.async {
                UserDefaults.standard.set(true, forKey: "UserIsNew")
                self.showInstructions()
            }
        }
    }
    
    
    // MARK: Button Functions
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        if textInput.text! != "" {
            NetworkManager.network.generateWord(config: textInput.text!.lowercased()) { randomName in
                self.outputTextView.text = randomName
            }
        } else {
            outputTextView.text = "please enter a config"
        }
        view.endEditing(true)
    }
    
    func visitWebsite() {
        if let url = NSURL(string: "http://www.fivoq.com") {
            UIApplication.shared.open(url as URL)
        }
    }
    
    func showInstructions() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let instructionsVC = storyBoard.instantiateViewController(withIdentifier: "InstructionsVC") as! InstructionsVC
        self.present(instructionsVC, animated: true, completion: nil)
    }
    
    func showSettings() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsVC = storyBoard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        self.present(settingsVC, animated: true, completion: nil)
    }
    
    
    // MARK: Keyboard
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
}
