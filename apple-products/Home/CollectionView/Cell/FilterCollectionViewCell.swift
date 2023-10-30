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
    
//  public func setupCell()
}
