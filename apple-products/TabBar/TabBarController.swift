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
    }
}
