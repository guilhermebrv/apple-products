//
//  TabBarController.swift
//  apple-products
//
//  Created by Guilherme Viana on 14/11/2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let products = UINavigationController(rootViewController: HomeViewController())
        let favorites = UINavigationController(rootViewController: FavoritesViewController())
        setViewControllers([products, favorites], animated: false)
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .lightGray
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .white
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "magnifyingglass")
        items[0].title = "Products"
        items[1].image = UIImage(systemName: "star")
        items[1].title = "Favorites"
    }
}
