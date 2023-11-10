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
        return 390
    }
    public func loadCurrentTableViewCell(indexPath: IndexPath) -> ProductsList {
        return productsData?.productsList?[indexPath.row] ?? ProductsList()
    }
    
//    MARK: Collection View Protocol
    public var numberOfItemsInSection: Int {
        return productsData?.filterProduct?.count ?? 0
    }
    public var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 30)
    }
    public func loadCurrentCollectionViewCell(indexPath: IndexPath) -> FilterProduct {
        return productsData?.filterProduct?[indexPath.row] ?? FilterProduct()
    }
    
//    MARK: Filter Product on Collection View
    public func setFilter(indexPath: IndexPath) {
        var filterProduct: [FilterProduct] = []
        for (index, value) in (productsData?.filterProduct ?? []).enumerated() {
            var type = value
            if index == indexPath.row {
                type.isSelected = true
            } else {
                type.isSelected = false
            }
            filterProduct.append(type)
        }
        productsData?.filterProduct = filterProduct
    }
    
    private var typeFilter: Int? {
        return productsData?.filterProduct?.first(where: {$0.isSelected == true})?.id
    }
    
    public func filterSearchText(text: String) {
        var productsList: [ProductsList] = []
        
        if typeFilter == 0 {
            productsList = productsData?.productsList ?? []
        } else {
            productsList = productsData?.productsList?.filter({$0.type == typeFilter ?? 0}) ?? []
        }
        
        productsData?.productsList = productsList
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
