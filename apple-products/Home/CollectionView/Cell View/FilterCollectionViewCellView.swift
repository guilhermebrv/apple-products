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
        label.text = "Macbook"
        label.backgroundColor = .grayApple
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "SFProDisplay-Regular", size: 15)
        label.clipsToBounds = true
        label.layer.cornerRadius = 18
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
        addSubview(filterLabel)
    }
    
    private func configConstraints() {
        filterLabel.pin(to: self)
    }
}
