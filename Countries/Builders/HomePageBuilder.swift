//
//  HomePageBuilder.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import UIKit

class HomePageBuilder {
    
    static func build() -> UIViewController {
        let viewModel = HomePageViewModel()
        let vc = HomePageViewController(with: viewModel)
        vc.navigationItem.title = "Countries"
        
        return vc
    }
    
}
