//
//  ProductsTableViewCell.swift
//  apple-products
//
//  Created by Guilherme Viana on 28/10/2023.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: ProductsTableViewCell.self)
    private var screen: ProductsTableViewCellView = ProductsTableViewCellView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(screen)
        screen.pin(to: contentView)
        backgroundColor = .clear
    }
    
    // DO IT LATER public func setupCell()
}
