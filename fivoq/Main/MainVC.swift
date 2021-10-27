//
//  MainVC
//  fivoq
//
//  Created by Brendan Saliba on 10/21/21.
//  Copyright © 2020 Brendan Saliba. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureMenu()
    }
    
    func configure() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        outputTextView.text = ""
        outputTextView.isEditable = false
        outputTextView.isScrollEnabled = false
        outputTextView.isSelectable = true
        
        textInput.delegate = self
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
    
    func copyToClipboard(toCopy: String) {
        UIPasteboard.general.string = toCopy
    }
    
    
    // MARK: Button Functions
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        if textInput.text! != "" {
            NetworkManager.network.generateWord(config: textInput.text!.lowercased()) { randomName in
                self.outputTextView.text = randomName
                
                if UserSettings.settings.autoCopyText {
                    self.copyToClipboard(toCopy: randomName)
                }
            }
        } else {
            outputTextView.text = "please enter a config"
        }
        view.endEditing(true)
    }
    
    
    // MARK: Navigation
    
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
    
    func visitWebsite() {
        if let url = NSURL(string: "http://www.fivoq.com") {
            UIApplication.shared.open(url as URL)
        }
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
