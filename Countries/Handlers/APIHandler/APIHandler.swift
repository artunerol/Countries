//
//  APIHandler.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import UIKit

class APIHandler {
    
    //MARK: - GetAPIDataFor HomeScreen Data
    
    ///Function That Makes URLRequest and brings back Data.
    public static func urlRequest(completion: @escaping (CountryDataFromAPI) -> Void) {
        
        let headers = [
            "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
            "x-rapidapi-key": "0f011425e5msh0080da57ecd569fp1833e9jsn91ca6c2fadac"
        ]

        let urlStringForCountries = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10"

        guard let urlForCountries = URL(string: urlStringForCountries) else { return }
        var urlRequest = URLRequest(url: urlForCountries)

        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        let urlSession = URLSession.shared
        let urlSessionDataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(CountryDataFromAPI.self, from: data)
                completion(json)
            }
            
            catch {
                print("Can not decode JSON and error is \(error.localizedDescription)")
            }
            
        }
        urlSessionDataTask.resume()
    }
    
    //MARK: - Get data for selected country
    
    public static func getDataForCountryImage(for countryCode: String, completion: @escaping (CountryImageData) -> Void) {
        
        let headers = [
            "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
            "x-rapidapi-key": "0f011425e5msh0080da57ecd569fp1833e9jsn91ca6c2fadac"
        ]
        
        let urlStringForCountries = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(countryCode)"
        
        guard let urlForCountries = URL(string: urlStringForCountries) else { return }
        var urlRequest = URLRequest(url: urlForCountries)
        
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        let urlSession = URLSession.shared
        let urlSessionDataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(CountryImageData.self, from: data)
                completion(json)
            }
            
            catch {
                print("Can not decode JSON and error is \(error.localizedDescription)")
            }
            
        }
        urlSessionDataTask.resume()
    }
}


