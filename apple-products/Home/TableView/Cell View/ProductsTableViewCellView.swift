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
        view.backgroundColor = .lightGray.withAlphaComponent(0.2)
        return view
    }()
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "person.fill") // FOR TESTING
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
        return imageView
    }()
    
    lazy var productOptionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "M2/M2Pro/M2Max Chip"
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
        squareView.pin(to: self)
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            
            logoImageView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            logoImageView.widthAnchor.constraint(equalToConstant: 29),
            logoImageView.heightAnchor.constraint(equalToConstant: 33),
            
            productLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor),
            productLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 5),
            
            infoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            infoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            infoImageView.widthAnchor.constraint(equalToConstant: 15),
            infoImageView.heightAnchor.constraint(equalToConstant: 15),
            
            productOptionsLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 5),
            productOptionsLabel.leadingAnchor.constraint(equalTo: productLabel.leadingAnchor),
        ])
    }
}
