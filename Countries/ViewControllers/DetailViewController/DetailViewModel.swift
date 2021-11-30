//
//  DetailViewModel.swift
//  Countries
//
//  Created by Artun Erol on 29.11.2021.
//

import UIKit

class DetailViewModel {
    
    var countryData: CountryData!
    
    ///Getting URL that consist the image URL as String.
    public func getImageURL(with completion: @escaping (String) -> Void) {
        APIHandler.getDataForCountryImage(for: self.countryData.code) { result in
            completion(result.data.flagImageUri)
        }
    }
    
}
