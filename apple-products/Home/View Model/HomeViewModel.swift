//
//  HomeViewModel.swift
//  apple-products
//
//  Created by Guilherme Viana on 26/10/2023.
//

import UIKit

class HomeViewModel {
    
//    MARK: Table View Protocol
    public var numberOfRowsInSection: Int {
        return 6 // UPDATE
    }
    public var heightForRowAt: CGFloat {
        return 390 // UPDATE
    }
    
//    MARK: Collection View Protocol
    public var numberOfItemsInSection: Int {
        return 6 // UPDATE
    }
    public var sizeForItemAt: CGSize {
        return CGSize(width: 85, height: 30) // UPDATE
    }
    
    
}
