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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showMain()
        }
    }
    
    func showMain() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyBoard.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.modalTransitionStyle = .crossDissolve
        self.present(mainVC, animated: true, completion: nil)
    }

}
