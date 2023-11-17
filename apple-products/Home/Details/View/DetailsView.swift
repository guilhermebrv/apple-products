//
//  DetailsView.swift
//  apple-products
//
//  Created by Guilherme Viana on 15/11/2023.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    func tappedExit()
}

class DetailsView: UIView {
    
    private weak var delegate: DetailsViewProtocol?
    public func delegate(delegate: DetailsViewProtocol) {
        self.delegate = delegate
    }
    
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
    
    lazy var exitImageView: UIImageView = {
        let imageView = UIImageView()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedExit))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "xmark.circle.fill") 
        imageView.tintColor = .lightGray.withAlphaComponent(0.5)
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gestureRecognizer)
        return imageView
    }()
    
    @objc public func tappedExit() {
        delegate?.tappedExit()
    }
    
    lazy var detailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: DetailsTableViewCell.identifier)
        return tableView
    }()
    
    public func delegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        detailsTableView.delegate = delegate
        detailsTableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
        backgroundColor = .whiteApple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(productTypeLabel)
        addSubview(productLabel)
        addSubview(exitImageView)
        addSubview(detailsTableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            productTypeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            productTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            productLabel.topAnchor.constraint(equalTo: productTypeLabel.bottomAnchor),
            productLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            exitImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            exitImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            exitImageView.widthAnchor.constraint(equalToConstant: 30),
            exitImageView.heightAnchor.constraint(equalToConstant: 30),
            
            detailsTableView.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 10),
            detailsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            detailsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            detailsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 25)
        ])
    }
}
