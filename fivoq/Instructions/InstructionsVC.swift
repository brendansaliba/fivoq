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
        UserDefaults.standard.set(false, forKey: "UserIsNew")

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyBoard.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.modalTransitionStyle = .crossDissolve
        self.present(mainVC, animated: true, completion: nil)
    }
    
}
