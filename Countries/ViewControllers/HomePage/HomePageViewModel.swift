//
//  HomePageViewModel.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import Foundation
import UIKit

struct HomePageViewModel {
    
    var color = UIColor.white
    var countryTitle : String = " "
    
    init() {
        APIHandler.urlRequest { results in
            print(results)
        }
    }
    
}

