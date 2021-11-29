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
    var apiResult: CountryDataFromAPI?
    
    //Getting API result via viewModel
    
    public func getAPIResult(with completion: @escaping () -> Void) {
        APIHandler.urlRequest { results in
            self.apiResult = results
            completion()
        }
    }
}
