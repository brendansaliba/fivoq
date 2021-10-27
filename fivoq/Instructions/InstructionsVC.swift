//
//  InstructionsVC
//  fivoq
//
//  Created by Brendan Saliba on 10/26/21.
//  Copyright © 2020 Brendan Saliba. All rights reserved.
//

import UIKit

class InstructionsVC: UIViewController {
    
    @IBOutlet weak var proceedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        switch UserDefaults.standard.bool(forKey: "UserIsNew") {
        case true:
            print("User is new")
            
        case false:
            proceedButton.isHidden = true
        }

    }
    
    @IBAction func proceedButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
            UserDefaults.standard.set(false, forKey: "UserIsNew")
        }
    }
    
}
