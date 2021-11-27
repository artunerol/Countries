//
//  APIHandler.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import UIKit

class APIHandler {
    
    ///Function That Makes URLRequest and brings back Data.
    public static func urlRequest(completion: @escaping (APIResult) -> Void) {
        
        let headers = [
            "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
            "x-rapidapi-key": "0f011425e5msh0080da57ecd569fp1833e9jsn91ca6c2fadac"
        ]

        let countriesURLString = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10"

        guard let countriesURL = URL(string: countriesURLString) else { return }
        var request = URLRequest(url: countriesURL)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, urlResponse, error in
            guard let data = data else { return }
            do {
                print("data is \(data)")
                print("urlResponse is \(urlResponse)")
                let json = try JSONDecoder().decode(APIResult.self, from: data)
                print("my json is \(json)")
                completion(json)
            }

            catch {
                print("Can not decode JSON and error is \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
}
