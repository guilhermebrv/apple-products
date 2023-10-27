//
//  HomeView.swift
//  apple-products
//
//  Created by Guilherme Viana on 26/10/2023.
//

import UIKit

class HomeView: UIView {

    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "apple-logo-black")
        return imageView
    }()
    
    lazy var sectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Products"
        label.font = UIFont(name: "SF-Pro-Display-Regular", size: 22)
        label.textColor = .black
        return label
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    lazy var filterCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    lazy var productsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        backgroundColor = UIColor(red: 245, green: 245, blue: 247, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoImageView)
        addSubview(sectionNameLabel)
        addSubview(searchBar)
        addSubview(filterCollectionView)
        addSubview(productsTableView)
        
    }
}
