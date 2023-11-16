//
//  DetailsTableViewView.swift
//  apple-products
//
//  Created by Guilherme Viana on 15/11/2023.
//

import UIKit

class DetailsTableViewView: UIView {

    lazy var squareView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .grayApple
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "apple-bg") // FOR TESTING
        return imageView
    }()
    
    lazy var colorsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var chipImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var specsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Macbook Pro 14″"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        label.textColor = .black
        return label
    }()
    
    lazy var detailedSpecsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Macbook Pro 14″"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$3,199.00"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = "Buy on website"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 19)
        return button
    }()
    
    lazy var addToFavoritesButton: UIButton = {
        let button = UIButton()
        button.configuration = .plain()
        button.configuration?.image = UIImage(systemName: "star")
        button.configuration?.title = "Add to favorites"
        button.configuration?.buttonSize = .small
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(squareView)
        squareView.addSubview(productImageView)
        squareView.addSubview(colorsButton)
        squareView.addSubview(chipImage)
        squareView.addSubview(specsLabel)
        squareView.addSubview(detailedSpecsLabel)
        squareView.addSubview(priceLabel)
        squareView.addSubview(buyButton)
        squareView.addSubview(addToFavoritesButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            squareView.topAnchor.constraint(equalTo: topAnchor),
            squareView.leadingAnchor.constraint(equalTo: leadingAnchor),
            squareView.trailingAnchor.constraint(equalTo: trailingAnchor),
            squareView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            productImageView.heightAnchor.constraint(equalToConstant: 200),
            
            colorsButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 15),
            colorsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            chipImage.topAnchor.constraint(equalTo: colorsButton.bottomAnchor, constant: 15),
            chipImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            chipImage.heightAnchor.constraint(equalToConstant: 80),
            chipImage.widthAnchor.constraint(equalToConstant: 80),
            
            specsLabel.topAnchor.constraint(equalTo: chipImage.bottomAnchor, constant: 15),
            specsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            specsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            detailedSpecsLabel.topAnchor.constraint(equalTo: specsLabel.bottomAnchor, constant: 15),
            detailedSpecsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            detailedSpecsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            priceLabel.topAnchor.constraint(equalTo: detailedSpecsLabel.bottomAnchor, constant: 15),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            buyButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            buyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buyButton.heightAnchor.constraint(equalToConstant: 45),
            
            addToFavoritesButton.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 10),
            addToFavoritesButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}
