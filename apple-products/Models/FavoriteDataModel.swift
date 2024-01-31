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
	
	public func getSavedData() -> [Device]? {
		do {
			let savedItems = try context.fetch(Device.fetchRequest())
			return savedItems
		} catch {
			print("error fetching data: \(error.localizedDescription)")
			return nil
		}
	}
	
	public func cleanSavedData() {
		do {
			let savedItems = try context.fetch(Device.fetchRequest())
			for item in savedItems {
				context.delete(item as NSManagedObject)
			}
			try context.save()
			print("all core data was eliminated")
		} catch {
			print("error cleaning data: \(error.localizedDescription)")
		}
	}

	public func saveFavorite(product: ProductsList) {
		newFavorite = Device(context: context)
		context.insert(newFavorite ?? Device())
		newFavorite?.productName = product.productName
		newFavorite?.startingPrice = product.startingPrice
		newFavorite?.chipImage = product.chipImage
		newFavorite?.productImage = product.productImage
		newFavorite?.buyLink = product.buyLink
		do {
			try context.save()
		} catch {
			print("error saving player name: \(error.localizedDescription)")
		}
	}
	
	public func removeFavorite(toRemove: ProductsList) {
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Device")
		fetchRequest.predicate = NSPredicate(format: "buyLink == %@", toRemove.buyLink ?? "")
		
		do {
			let results = try context.fetch(fetchRequest) as? [Device]
			if let deviceToDelete = results?.first {
				context.delete(deviceToDelete)
				try context.save()
			}
		} catch {
			print("Error removing favorite: \(error.localizedDescription)")
		}
	}
}
