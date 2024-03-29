//
//  HomeData.swift
//  apple-products
//
//  Created by Guilherme Viana on 07/11/2023.
//

import Foundation

// MARK: - HomeData
struct HomeData: Codable {
    var filterProduct: [FilterProduct]?
    var productsList: [ProductsList]?

    enum CodingKeys: String, CodingKey {
        case filterProduct = "filter_product"
        case productsList = "products_list"
    }
}

// MARK: - FilterProduct
struct FilterProduct: Codable {
    var title: String?
    var id: Int?
    var isSelected: Bool?
}

// MARK: - ProductsList
struct ProductsList: Codable {
    var productName: String?
    var chipImage, productImage: String?
    var startingPrice: String?
    var buyLink: String?
    var type: Int?
    var specs, detailedSpecs: String?
    

    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case chipImage = "chip_image"
        case productImage = "product_image"
        case startingPrice = "starting_price"
        case buyLink = "buy_link"
        case type, specs
        case detailedSpecs = "detailed_specs"
    }
}

