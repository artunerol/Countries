//
//  HomePageViewModel.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import Foundation
import UIKit

class HomePageViewModel {
    
    var color = UIColor.white
    var apiResult: APIResult?
    
    public func getAPIResult(with completion: @escaping () -> Void) {
        APIHandler.urlRequest { results in
            print(results)
            self.apiResult = results
            completion()
        }
    }
}
