//
//  DetailsViewController.swift
//  apple-products
//
//  Created by Guilherme Viana on 15/11/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var screen: DetailsView?
    
    override func loadView() {
        screen = DetailsView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
