//
//  HomeViewModel.swift
//  apple-products
//
//  Created by Guilherme Viana on 26/10/2023.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func error()
}

class HomeViewModel {
    private var productsData: HomeData?
    private var homeService: HomeService = HomeService()
    private weak var delegate: HomeViewModelProtocol?
    public func delegate(delegate: HomeViewModelProtocol) {
        self.delegate = delegate
    }
    
//    MARK: Table View Protocol
    public var numberOfRowsInSection: Int {
        return productsData?.productsList?.count ?? 0
    }
    public var heightForRowAt: CGFloat {
        return 390 // UPDATE
    }
    
//    MARK: Collection View Protocol
    public var numberOfItemsInSection: Int {
        return productsData?.filterProduct?.count ?? 0
    }
    public var sizeForItemAt: CGSize {
        return CGSize(width: 85, height: 30) // UPDATE
    }
    
//    MARK: Fetch Data from Service
    public func fetchRequest() {
        homeService.fetchHomeData { result, error in
            if error == nil {
                self.productsData = result
                self.delegate?.success()
            } else {
                self.delegate?.error()
            }
        }
    }

    
    
}
