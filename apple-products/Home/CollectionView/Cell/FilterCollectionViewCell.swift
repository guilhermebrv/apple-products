//
//  FilterCollectionViewCell.swift
//  apple-products
//
//  Created by Guilherme Viana on 28/10/2023.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: FilterCollectionViewCell.self)
    public var screen: FilterCollectionViewCellView = FilterCollectionViewCellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    public func setupCell(data: FilterProduct) {
        screen.filterLabel.text = data.title
        if data.isSelected == true {
            screen.filterLabel.backgroundColor = .blueApple.withAlphaComponent(0.8)
        } else {
            screen.filterLabel.backgroundColor = .lightGray.withAlphaComponent(0.1)
        }
    }
}
