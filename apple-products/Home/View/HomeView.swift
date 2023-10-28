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
        label.font = UIFont(name: "SFProDisplay-Regular", size: 32)
        label.textColor = .black
        return label
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.clipsToBounds = true
        searchBar.backgroundColor = UIColor.grayApple
        searchBar.barTintColor = UIColor.grayApple
        searchBar.layer.cornerRadius = 20
        searchBar.barStyle = .black
        searchBar.searchTextField.leftView?.tintColor = .black.withAlphaComponent(0.5)
        searchBar.placeholder = "Search for a product:"
        return searchBar
    }()
    
    lazy var filterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .blue //UIColor.whiteApple
        //collectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
        return collectionView
    }()
    
    public func delegateCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        filterCollectionView.delegate = delegate
        filterCollectionView.dataSource = dataSource
    }
    
    lazy var productsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .red //UIColor.whiteApple
        //tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        return tableView
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
        addSubview(logoImageView)
        addSubview(sectionNameLabel)
        addSubview(searchBar)
        addSubview(filterCollectionView)
        addSubview(productsTableView)
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            logoImageView.heightAnchor.constraint(equalToConstant: 33),
            logoImageView.widthAnchor.constraint(equalToConstant: 29),
            
            sectionNameLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor),
            sectionNameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 15),
            
            searchBar.topAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchBar.heightAnchor.constraint(equalToConstant: 45),
            
            filterCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            filterCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            productsTableView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
