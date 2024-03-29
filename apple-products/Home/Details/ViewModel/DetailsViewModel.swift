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
    
    // MARK: Reading, adding and removing products from CoreData
	public func isProductFavorited(product: ProductsList) -> Bool {
		return FavoriteDataModel.shared.getSavedData()?.contains(where: { $0.buyLink == product.buyLink }) ?? false
    }
	
	public func saveFavoriteToData(data: ProductsList) {
		FavoriteDataModel.shared.saveFavorite(product: data)
	}

    
    public func removeFromFavoritesData(data: ProductsList) {
		FavoriteDataModel.shared.removeFavorite(toRemove: data)
    }
}
