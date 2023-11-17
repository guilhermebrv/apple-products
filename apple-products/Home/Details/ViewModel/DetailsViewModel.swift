//
//  DetailsViewModel.swift
//  apple-products
//
//  Created by Guilherme Viana on 15/11/2023.
//

import UIKit

class DetailsViewModel {
    
    let product: ProductsList
    
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
        
        //adicionar tamanho buttons de cor
                
        return 415 + chipImage + specs + detailedSpecs + price
    }
}
