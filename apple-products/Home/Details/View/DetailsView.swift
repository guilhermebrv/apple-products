//
//  DetailsView.swift
//  apple-products
//
//  Created by Guilherme Viana on 15/11/2023.
//

import UIKit

class DetailsView: UIView {
    
    lazy var productTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mac"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = .darkGray.withAlphaComponent(0.7)
        return label
    }()
    
    lazy var productLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Macbook Pro 14″"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var detailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        //tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.identifier)
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
        addSubview(productTypeLabel)
        addSubview(productLabel)
        addSubview(detailsTableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
        ])
    }
}
