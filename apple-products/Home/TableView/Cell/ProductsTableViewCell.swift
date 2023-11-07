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
    
    public func setupCell(data: ProductsList) {
        if let urlProduct: URL = URL(string: data.productImage ?? ""), let urlChip: URL = URL(string: data.chipImage ?? "") {
            URLSession.shared.dataTask(with: urlProduct) { data, response, error in
                //CONTINUE LATER
            }
            //screen.chipImage.image = uiima
            //screen.productImageView
        }
        screen.productLabel.text = data.productName
        screen.startingPriceLabel.text = data.startingPrice
    }
}
