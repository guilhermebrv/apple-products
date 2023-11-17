//
//  String - Extension.swift
//  apple-products
//
//  Created by Guilherme Viana on 17/11/2023.
//

import UIKit
import Foundation

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
           let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
           let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
           
           return ceil(boundingBox.height)
       }
       
   func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
       let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
       let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
       
       return ceil(boundingBox.width)
   }
}
