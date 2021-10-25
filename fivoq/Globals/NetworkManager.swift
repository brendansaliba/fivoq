//
//  NetworkManager
//  fivoq
//
//  Created by Brendan Saliba on 10/21/21.
//  Copyright © 2020 Brendan Saliba. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class NetworkManager {
    
    static let network = NetworkManager()
    
    func generateWord(config: String, completion: @escaping (String) -> Void) {
        AF.request("https://7fjvygtwc4.execute-api.us-west-2.amazonaws.com/generate/\(config)").responseJSON { response in
            switch response.result {
            case .success:
                let jsonData = JSON(response.data!)
                print(jsonData)
                let randomName = jsonData["randomName"].string!
                
                completion(randomName)

            case .failure(let error):
                print(error)
                completion("ERROR")
            }
        }
    }
    
}

