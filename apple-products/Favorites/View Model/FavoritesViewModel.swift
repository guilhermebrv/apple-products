//
//  FavoritesViewModel.swift
//  apple-products
//
//  Created by Guilherme Viana on 14/11/2023.
//

import UIKit

class FavoritesViewModel {
    
    // MARK: Reading favorites' data
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let defaults = UserDefaults.standard
    
    public func readFavoritesData() -> [ProductsList]? {
        if let savedProducts = defaults.object(forKey: "SavedProducts") as? Data {
            if let loadedProducts = try? decoder.decode([ProductsList].self, from: savedProducts) {
                return loadedProducts
            }
        }
        return nil
    }
    
    // MARK: Table View Aux
    public var numberOfRowsInSection: Int {
        let favoriteProducts = readFavoritesData()
        return favoriteProducts?.count ?? 0
    }
    
    public var heightForRowAt: CGFloat {
        return 390
    }
    
    public func loadCurrentFavoriteCell(indexPath: IndexPath) -> ProductsList {
        if let favoriteProducts = readFavoritesData(), favoriteProducts.isEmpty == false {
            return favoriteProducts[indexPath.row]
        } else {
            return ProductsList()
        }
    }
}
