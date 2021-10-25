//
//  GlobalExtensions
//  fivoq
//
//  Created by Brendan Saliba on 10/24/21.
//  Copyright © 2020 Brendan Saliba. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.size.height, width: self.frame.size.width - 10, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
    
}
