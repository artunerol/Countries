//
//  DetailViewModel.swift
//  Countries
//
//  Created by Artun Erol on 29.11.2021.
//

import UIKit

class DetailViewModel {
    
    var countryCode : String!
    var wikiDataID: String!
    
    public func getImageURL(with completion: @escaping (String) -> Void) {
        APIHandler.getDataForCountryImage(for: self.countryCode!) { result in
            completion(result.data.flagImageUri)
        }
    }
    
}
