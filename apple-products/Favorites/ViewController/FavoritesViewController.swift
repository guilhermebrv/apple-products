//
//  FavoritesViewController.swift
//  apple-products
//
//  Created by Guilherme Viana on 14/11/2023.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    private var screen: FavoritesView?
    
    override func loadView() {
        screen = FavoritesView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.backgroundColor = UIColor.whiteApple
    }
    
}
