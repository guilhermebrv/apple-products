//
//  FavoritesView.swift
//  apple-products
//
//  Created by Guilherme Viana on 14/11/2023.
//

import UIKit

class FavoritesView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
        ])
    }

}
