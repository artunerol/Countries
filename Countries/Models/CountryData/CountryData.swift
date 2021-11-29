//
//  APIResultKeys.swift
//  Countries
//
//  Created by Artun Erol on 27.11.2021.
//

import Foundation

struct CountryData: Codable,Equatable {
    let name : String
    let code: String
    let wikiDataId: String    
}
