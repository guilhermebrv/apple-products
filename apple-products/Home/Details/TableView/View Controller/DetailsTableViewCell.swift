//
//  DetailsTableViewCell.swift
//  apple-products
//
//  Created by Guilherme Viana on 15/11/2023.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: DetailsTableViewCell.self)
    private var screen: DetailsTableViewView = DetailsTableViewView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(screen)
        screen.pin(to: contentView)
        backgroundColor = .clear
    }
    
    //public func setupCell() {}
    
}
