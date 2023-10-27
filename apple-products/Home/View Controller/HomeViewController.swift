//
//  ViewController.swift
//  apple-products
//
//  Created by Guilherme Viana on 24/10/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var screen: HomeView?
    
    override func loadView() {
        screen = HomeView()
        screen?.backgroundColor = UIColor.whiteApple
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
    }
}

