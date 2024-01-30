//
//  FavoriteDataModel.swift
//  apple-products
//
//  Created by Guilherme Viana on 30/01/2024.
//

import UIKit
import CoreData

class FavoriteDataModel {
	static let shared = FavoriteDataModel()
	private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	var newFavorite: Device?
	
	private init() { }

	public func saveFavorite(product: ProductsList) {
		newFavorite = Device(context: context)
		context.insert(newFavorite ?? Device())
		newFavorite?.name = product.productName
		do {
			try context.save()
		} catch {
			print("error saving player name: \(error.localizedDescription)")
		}
	}
	
	public func removeFavorite() {
		context.delete(newFavorite ?? Device())
		do {
			try context.save()
		} catch {
			print("error removing favorite: \(error.localizedDescription)")
		}
	}
}
