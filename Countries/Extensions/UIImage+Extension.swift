//
//  UIImage+Extension.swift
//  Countries
//
//  Created by Artun Erol on 29.11.2021.
//

import UIKit

extension UIImage {

    static func convertURLToImage(for urlString: String) -> UIImage{
        let url = URL(string: urlString)
        var image: UIImage = UIImage()
        if let data = try? Data(contentsOf: url!) {
            image = UIImage(data: data)!
        }
        return image
    }
}
