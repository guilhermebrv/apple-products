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
    }
    
    private func signProtocols() {
        screen?.delegateCollectionView(delegate: self, dataSource: self)
        screen?.delegateTableView(delegate: self, dataSource: self)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // ADD CELL
        // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>) as?
        return UICollectionViewCell()
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
        // ADD CELL
        // let cell = tableView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>) as? 
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
    
}


