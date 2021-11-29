//
//  UIImageView+Extension.swift
//  Countries
//
//  Created by Artun Erol on 29.11.2021.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                guard
                    let data = data, error == nil,
                    let image = UIImage(data: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    print("dispatch")
                    self?.image = image
                }
            }
            else {
                print("error is \(error)")
            }
            
        }.resume()
    }
}
