//
//  TabBarControllerBuilder.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import UIKit

class TabBarControllerBuilder {
    
   static func build() -> UIViewController {
        let homePageViewController = HomePageBuilder.build()
       homePageViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill")) // Setting tab bar Item name and images for HomePage
       
       let savedViewController = SavePageBuilder.build()
       savedViewController.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homePageViewController, savedViewController]
        
        return tabbarController
    }
}
