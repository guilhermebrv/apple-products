//
//  DetailsTableViewCell.swift
//  apple-products
//
//  Created by Guilherme Viana on 15/11/2023.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: DetailsTableViewCell.self)
    private var screen: DetailsTableViewView = DetailsTableViewView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configScreen()
        screen.delegate(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(screen)
        screen.pin(to: contentView)
        backgroundColor = .clear
    }
    
    public func setupCell(product: ProductsList) {
        selectionStyle = .none
        screen.productImageView.image = UIImage(named: product.productImage ?? "")
        if let urlProduct: URL = URL(string: product.productImage ?? "") {
            URLSession.shared.dataTask(with: urlProduct) { data, response, error in
                if error != nil {
                    return
                }
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.screen.productImageView.image = image
                    }
                }
            }.resume()
        }
        if let urlChip: URL = URL(string: product.chipImage ?? ""), urlChip.absoluteString.isEmpty == false {
            URLSession.shared.dataTask(with: urlChip) { data, response, error in
                if error != nil {
                    return
                }
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.screen.chipImage.isHidden = false
                        self.screen.chipImage.image = image
                    }
                }
            }.resume()
        } else {
            self.screen.removeChipConstraints()
            var belowElementsConstraint: NSLayoutConstraint!
            belowElementsConstraint = self.screen.specsLabel.topAnchor.constraint(equalTo: self.screen.productImageView.bottomAnchor, constant: 15)
            belowElementsConstraint.isActive = true
        }
        screen.buyButton.
        screen.buyOnSafari(sender: screen.buyButton, url: product.buyLink ?? "")
        screen.priceLabel.text = product.startingPrice
        screen.specsLabel.text = product.specs
        screen.detailedSpecsLabel.text = product.detailedSpecs
    }
    
}

extension DetailsTableViewCell: DetailsTableViewViewProtocol {
    func buyOnSafari(sender: UIButton, url: String) {
        print("cu")
        /*if let buyURL: URL = URL(string: url) {
            UIApplication.shared.open(buyURL, options: [:], completionHandler: nil)
        }*/
    }
    
    func tappedFavoritesButton() {
        if screen.addToFavoritesButton.configuration?.image == UIImage(systemName: "star") {
            screen.addToFavoritesButton.configuration?.image = UIImage(systemName: "star.fill")
            screen.addToFavoritesButton.configuration?.title = "Remove from favorites"
        } else {
            screen.addToFavoritesButton.configuration?.image = UIImage(systemName: "star")
            screen.addToFavoritesButton.configuration?.title = "Add to favorites"
        }
    }
}
