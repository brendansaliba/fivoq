//
//  MainVC
//  fivoq
//
//  Created by Brendan Saliba on 10/21/21.
//  Copyright © 2020 Brendan Saliba. All rights reserved.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var outputTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        outputTextView.text = ""
        outputTextView.isEditable = false
        outputTextView.isSelectable = true
                
    }
    
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
    
    
    // MARK: Keyboard
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}
