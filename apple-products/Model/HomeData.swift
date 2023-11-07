//
//  HomeData.swift
//  apple-products
//
//  Created by Guilherme Viana on 07/11/2023.
//

import Foundation

// MARK: - Welcome
struct HomeData: Codable {
    let filterProduct: [FilterProduct]?
    let productsList: [ProductsList]?

    enum CodingKeys: String, CodingKey {
        case filterProduct = "filter_product"
        case productsList = "products_list"
    }
}

// MARK: - FilterProduct
struct FilterProduct: Codable {
    let title: String?
    let id: Int?
    let isSelected: Bool?
}

// MARK: - ProductsList
struct ProductsList: Codable {
    let productName: String?
    let chipImage, productImage: String?
    let startingPrice: String?
    let buyLink: String?
    let type: Int?
    let moreInfo: [MoreInfo]?

    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case chipImage = "chip_image"
        case productImage = "product_image"
        case startingPrice = "starting_price"
        case buyLink = "buy_link"
        case type
        case moreInfo = "more_info"
    }
}

// MARK: - MoreInfo -                                                          UPDATE WITH ACTUAL INFORMATION
struct MoreInfo: Codable {
    let userName: String?
    let userImage: String?
    let nftPrice: Double?
    let lastAccess: String?

    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case userImage = "user_image"
        case nftPrice = "nft_price"
        case lastAccess = "last_access"
    }
}

