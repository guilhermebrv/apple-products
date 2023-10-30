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
        view.backgroundColor = .lightGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 14
        return view
    }()
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "macbook") // FOR TESTING
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
        label.text = "Macbook Pro"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "info.circle.fill") // FOR TESTING
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    lazy var productOptionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "M2 • M2 Pro • M2 Max Chip"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = .darkGray.withAlphaComponent(0.7)
        return label
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
        squareView.addSubview(productOptionsLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            squareView.topAnchor.constraint(equalTo: topAnchor),
            squareView.leadingAnchor.constraint(equalTo: leadingAnchor),
            squareView.trailingAnchor.constraint(equalTo: trailingAnchor),
            squareView.heightAnchor.constraint(equalToConstant: 365),
            
            productImageView.topAnchor.constraint(equalTo: squareView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: squareView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: squareView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 285),
            
            logoImageView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 12),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            logoImageView.widthAnchor.constraint(equalToConstant: 20),
            logoImageView.heightAnchor.constraint(equalToConstant: 24),
            
            productLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -2),
            productLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 5),
            
            infoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            infoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            infoImageView.widthAnchor.constraint(equalToConstant: 30),
            infoImageView.heightAnchor.constraint(equalToConstant: 30),
            
            productOptionsLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 5),
            productOptionsLabel.leadingAnchor.constraint(equalTo: productLabel.leadingAnchor),
        ])
    }
}
