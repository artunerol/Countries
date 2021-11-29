//
//  Userdefaults+Extension.swift
//  Countries
//
//  Created by Artun Erol on 28.11.2021.
//

import Foundation

//MARK: - Defining an enum to avoid mistype

enum UserDefaultsKey: String {
    case isButtonSelected = "isButtonSelected"
}

//MARK: -

extension UserDefaults {
    ///Userdefaults Saving custom CountryData
    func saveCountryData(with data: CountryData) {
        
        do {
            let data = try JSONEncoder().encode(data)
            
            UserDefaults.standard.set(data, forKey: UserDefaultsKey.isButtonSelected.rawValue)
        }
        catch {
            print("Unable to encode CountryData")
        }
        
    }
    
    ///Userdefaults getting custom  CountryData
    func getCountryData() -> CountryData? {
        if let data = UserDefaults.standard.data(forKey: UserDefaultsKey.isButtonSelected.rawValue) {
            
            do {
                let countryData = try JSONDecoder().decode(CountryData.self, from: data)
                return countryData
            }
            
            catch {
                print("Unable to decode CountryData")
            }
        }
        return nil
    }
}
