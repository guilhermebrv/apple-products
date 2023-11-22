//
//  DetailsViewModel.swift
//  apple-products
//
//  Created by Guilherme Viana on 15/11/2023.
//

import UIKit

class DetailsViewModel {
    
    let product: ProductsList
    let tableScreen: DetailsTableViewView = DetailsTableViewView()
    
    init(product: ProductsList) {
        self.product = product
    }
    public var numberOfRowsInSection: Int {
        return 1
    }
    public func heightForRowAt(width: CGFloat) -> CGFloat {
        var chipImage: CGFloat = 0
        if product.chipImage != "" {
            chipImage += 75
        }
        
        let specs = product.specs?.height(withConstrainedWidth: width - 40, font: UIFont(name: "SFProDisplay-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28)) ?? CGFloat()
        let detailedSpecs = product.detailedSpecs?.height(withConstrainedWidth: width - 40, font: UIFont(name: "SFProDisplay-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18)) ?? CGFloat()
        let price = product.startingPrice?.height(withConstrainedWidth: width - 40, font: UIFont(name: "SFProDisplay-Bold", size: 26) ?? UIFont.systemFont(ofSize: 26)) ?? CGFloat()
                        
        return 380 + chipImage + specs + detailedSpecs + price
    }
    
    // MARK: Adding, reading and removing products from Favorites Data
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let defaults = UserDefaults.standard
    
    public func saveFavoriteToData(data: ProductsList) {
        var savedProducts = readFavoritesData() ?? []
        if !savedProducts.contains(where: { $0.buyLink == data.buyLink }) {
            savedProducts.append(data)
            if let encoded = try? encoder.encode(savedProducts) {
                defaults.set(encoded, forKey: "SavedProducts")
            }
        }
    }
    
    public func readFavoritesData() -> [ProductsList]? {
        if let savedProducts = defaults.object(forKey: "SavedProducts") as? Data {
            if let loadedProducts = try? decoder.decode([ProductsList].self, from: savedProducts) {
                return loadedProducts
            }
        }
        return nil
    }
    
    public func isProductFavorited(product: ProductsList) -> Bool {
        if let favorites = readFavoritesData(), favorites.contains(where: { $0.buyLink == product.buyLink }) {
            return true
        } else {
            return false
        }
    }
    
    //apagar esta funcao, apenas para testes
    public func printAllStoredData() {
        if let allFavorites = readFavoritesData() {
            for product in allFavorites {
                print(product)
            }
        }
    }
}
