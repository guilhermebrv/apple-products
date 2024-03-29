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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
		screen?.spinner.startAnimating()
        signProtocols()
		dismissKeyBoard()
        viewModel.fetchRequest()
    }
}

extension HomeViewController {
	private func signProtocols() {
		viewModel.delegate(delegate: self)
		screen?.delegateSearchBar(delegate: self)
	}
}

extension HomeViewController: HomeViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.screen?.delegateCollectionView(delegate: self, dataSource: self)
            self.screen?.delegateTableView(delegate: self, dataSource: self)
            self.screen?.productsTableView.reloadData()
			self.screen?.spinner.stopAnimating()
        }
    }
    
    func error() {
        print("error fetching data request")
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterSearchText(text: searchText)
        screen?.productsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as? FilterCollectionViewCell
        cell?.setupCell(data: viewModel.loadCurrentCollectionViewCell(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.setFilter(indexPath: indexPath, searchText: screen?.searchBar.text ?? "")
        screen?.filterCollectionView.reloadData()
        screen?.filterCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
		screen?.productsTableView.reloadData()
		if viewModel.numberOfRowsInSection > 0 {
			screen?.productsTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
		}
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = DetailsViewController(product: viewModel.loadCurrentTableViewCell(indexPath: indexPath))
        present(details, animated: true)
    }
}


