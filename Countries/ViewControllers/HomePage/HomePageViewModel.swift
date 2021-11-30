//
//  HomePageViewModel.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import Foundation
import UIKit

class HomePageViewModel {

    var apiResult: CountryDataFromAPI?
    
    //Getting API result via viewModel
    
    public func getAPIResult(with completion: @escaping () -> Void) {
        APIHandler.urlRequest() { result in
            self.apiResult = result
            completion()
        }
    }
}
