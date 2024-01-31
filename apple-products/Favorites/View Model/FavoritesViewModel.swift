//
//  FavoritesViewModel.swift
//  apple-products
//
//  Created by Guilherme Viana on 14/11/2023.
//

import UIKit

class FavoritesViewModel {
    public func readFavoritesData() -> [Device]? {
		return FavoriteDataModel.shared.getSavedData()
    }
    
    // MARK: Table View Aux
    public var numberOfRowsInSection: Int {
        let favoriteProducts = readFavoritesData()
        return favoriteProducts?.count ?? 0
    }
    
    public var heightForRowAt: CGFloat {
        return 390
    }
    
    public func loadCurrentFavoriteCell(indexPath: IndexPath) -> Device {
        if let favoriteProducts = readFavoritesData(), favoriteProducts.isEmpty == false {
            return favoriteProducts[indexPath.row]
        } else {
            return Device()
        }
    }
	
	public func loadCurrentFavoriteCellModal(indexPath: IndexPath) -> ProductsList {
		if let favoriteProducts = readFavoritesData(), favoriteProducts.isEmpty == false {
			let favorite = favoriteProducts[indexPath.row]
			let product = ProductsList(productName: favorite.productName, chipImage: favorite.chipImage, productImage: favorite.productImage, startingPrice: favorite.startingPrice, buyLink: favorite.buyLink, specs: favorite.specs, detailedSpecs: favorite.detailedSpecs)
			return product
		} else {
			return ProductsList()
		}
	}
}
