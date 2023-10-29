//
//  FilterCollectionViewCellView.swift
//  apple-products
//
//  Created by Guilherme Viana on 28/10/2023.
//

import UIKit

class FilterCollectionViewCellView: UIView {
    
    lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        label.backgroundColor = .white
        label.textColor = .blueApple
        label.layer.borderColor = UIColor.blueApple.cgColor
        label.layer.borderWidth = 1.5
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(filterLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            filterLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
