//
//  UIViewController + Extension.swift
//  apple-products
//
//  Created by Guilherme Viana on 30/01/2024.
//

import UIKit

extension UIViewController {
	func dismissKeyBoard() {
		let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
}
