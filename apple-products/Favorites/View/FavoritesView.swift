//
//  FavoritesView.swift
//  apple-products
//
//  Created by Guilherme Viana on 14/11/2023.
//

import UIKit

class FavoritesView: UIView {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "apple-logo-black")
        return imageView
    }()
    
    lazy var sectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favorites"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 34)
        label.textColor = .black
        return label
    }()
    
    lazy var noFavoritesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You currently don't have any favorite products :("
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProDisplay-Regular", size: 22)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    lazy var favoritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.identifier)
        return tableView
    }()
    
    public func delegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        favoritesTableView.delegate = delegate
        favoritesTableView.dataSource = dataSource
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoImageView)
        addSubview(sectionNameLabel)
        addSubview(noFavoritesLabel)
        addSubview(favoritesTableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            logoImageView.heightAnchor.constraint(equalToConstant: 32),
            logoImageView.widthAnchor.constraint(equalToConstant: 28),
            
            sectionNameLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -2),
            sectionNameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
            
            noFavoritesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            noFavoritesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            noFavoritesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            noFavoritesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            favoritesTableView.topAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor, constant: 25),
            favoritesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoritesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
