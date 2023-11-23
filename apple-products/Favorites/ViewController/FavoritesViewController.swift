//
//  FavoritesViewController.swift
//  apple-products
//
//  Created by Guilherme Viana on 14/11/2023.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    public var screen: FavoritesView?
    private var viewModel: FavoritesViewModel = FavoritesViewModel()
    
    override func loadView() {
        screen = FavoritesView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        screen?.favoritesTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.backgroundColor = UIColor.whiteApple
        signProtocols()
    }
    
    private func signProtocols() {
        screen?.delegateTableView(delegate: self, dataSource: self)
    }
}

extension FavoritesViewController: DetailsViewControllerProtocol {
    func modalViewControllerDidDismiss() {
        screen?.favoritesTableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.numberOfRowsInSection == 0 {
            screen?.noFavoritesLabel.isHidden = false
        } else {
            screen?.noFavoritesLabel.isHidden = true
        }
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.identifier, for: indexPath) as? ProductsTableViewCell
        cell?.selectionStyle = .none
        cell?.setupCell(data: viewModel.loadCurrentFavoriteCell(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modal = DetailsViewController(product: viewModel.loadCurrentFavoriteCell(indexPath: indexPath))
        modal.delegate = self
        present(modal, animated: true, completion: nil)
    }
}
