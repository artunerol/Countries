//
//  SaveButtonProtocol.swift
//  Countries
//
//  Created by Artun Erol on 28.11.2021.
//

import Foundation

protocol SaveButtonProtocol {
    func saveButtonClicked(with data: CountryData)
    func unsaveButtonClicked(with data: CountryData)
}
