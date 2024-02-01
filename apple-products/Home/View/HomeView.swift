//
//  HomeView.swift
//  apple-products
//
//  Created by Guilherme Viana on 26/10/2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func delegateCollectionView()
    func delegateTableView()
    func delegateSearchBar()
}

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
        label.font = UIFont(name: "SFProDisplay-Regular", size: 34)
        label.textColor = .black
        return label
    }()
	
	lazy var spinner: UIActivityIndicatorView = {
		let spinner = UIActivityIndicatorView(style: .large)
		spinner.translatesAutoresizingMaskIntoConstraints = false
		spinner.center = superview?.center ?? CGPoint()
		spinner.color = .lightGray
		spinner.hidesWhenStopped = true
		return spinner
	}()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 20
        searchBar.searchBarStyle = .minimal
        searchBar.barStyle = .black
        searchBar.tintColor = .darkGray
        searchBar.searchTextField.leftView?.tintColor = .black.withAlphaComponent(0.5)
        searchBar.placeholder = "Search for a product:"
        return searchBar
    }()
    
    public func delegateSearchBar(delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
    
    lazy var filterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 15, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.whiteApple
        collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.identifier)
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
        tableView.backgroundColor = .clear
        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.identifier)
        return tableView
    }()
    
    public func delegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        productsTableView.delegate = delegate
        productsTableView.dataSource = dataSource
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
        addSubview(searchBar)
        addSubview(filterCollectionView)
        addSubview(productsTableView)
		productsTableView.addSubview(spinner)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            logoImageView.heightAnchor.constraint(equalToConstant: 32),
            logoImageView.widthAnchor.constraint(equalToConstant: 28),
			
			spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
			spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sectionNameLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -2),
            sectionNameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
            
            searchBar.topAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchBar.heightAnchor.constraint(equalToConstant: 45),
            
            filterCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            filterCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 65),
            
            productsTableView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
