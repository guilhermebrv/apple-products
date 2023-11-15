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
        view.layer.cornerRadius = 20
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
        label.font = UIFont(name: "SFProDisplay-Bold", size: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var detailedSpecsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Macbook Pro 14″"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Macbook Pro 14″"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
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
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            squareView.topAnchor.constraint(equalTo: topAnchor),
            squareView.leadingAnchor.constraint(equalTo: leadingAnchor),
            squareView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

}
