//
//  ViewController.swift
//  apple-products
//
//  Created by Guilherme Viana on 24/10/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var screen: HomeView?
    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeView()
        screen?.backgroundColor = UIColor.whiteApple
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        signProtocols()
        viewModel.fetchRequest()
    }
    
    private func signProtocols() {
        viewModel.delegate(delegate: self)
    }
}

extension HomeViewController: HomeViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.screen?.delegateTableView(delegate: self, dataSource: self)
            self.screen?.delegateCollectionView(delegate: self, dataSource: self)
            self.screen?.productsTableView.reloadData()
        }
    }
    
    func error() {
        //
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as? FilterCollectionViewCell
        if indexPath.row == 0 {
            cell?.screen.filterLabel.backgroundColor = .systemBlue.withAlphaComponent(0.8) // put it in a better place
        }
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.identifier, for: indexPath) as? ProductsTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentTableViewCell(indexPath: indexPath))
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
    
}


