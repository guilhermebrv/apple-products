//
//  ProductsTableViewCellView.swift
//  apple-products
//
//  Created by Guilherme Viana on 28/10/2023.
//

import UIKit

class ProductsTableViewCellView: UIView {
    
    lazy var squareView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.setCardShadow()
        view.layer.cornerRadius = 14
        return view
    }()
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = nil
        return imageView
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "apple-logo-black")
        return imageView
    }()
    
    lazy var productLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Macbook Pro 14″"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "info.circle.fill") // FOR TESTING
        imageView.tintColor = .lightGray.withAlphaComponent(0.5)
        return imageView
    }()
    
    lazy var startingPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "From "
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = .darkGray.withAlphaComponent(0.7)
        return label
    }()
    
    lazy var chipImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
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
        squareView.addSubview(logoImageView)
        squareView.addSubview(productLabel)
        squareView.addSubview(infoImageView)
        squareView.addSubview(startingPriceLabel)
        squareView.addSubview(chipImage)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            squareView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            squareView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            squareView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            squareView.heightAnchor.constraint(equalToConstant: 365),
            
            productImageView.topAnchor.constraint(equalTo: squareView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: squareView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: squareView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 285),
            
            logoImageView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 12),
            logoImageView.leadingAnchor.constraint(equalTo: squareView.leadingAnchor, constant: 14),
            logoImageView.widthAnchor.constraint(equalToConstant: 18),
            logoImageView.heightAnchor.constraint(equalToConstant: 22),
            
            productLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -2),
            productLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 5),
            
            infoImageView.topAnchor.constraint(equalTo: squareView.topAnchor, constant: 10),
            infoImageView.trailingAnchor.constraint(equalTo: squareView.trailingAnchor, constant: -10),
            infoImageView.widthAnchor.constraint(equalToConstant: 30),
            infoImageView.heightAnchor.constraint(equalToConstant: 30),
            
            startingPriceLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 2),
            startingPriceLabel.leadingAnchor.constraint(equalTo: productLabel.leadingAnchor),
            
            chipImage.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 17),
            chipImage.trailingAnchor.constraint(equalTo: squareView.trailingAnchor, constant: -12),
            chipImage.widthAnchor.constraint(equalToConstant: 45),
            chipImage.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}
