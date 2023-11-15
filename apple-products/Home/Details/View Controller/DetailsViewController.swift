//
//  DetailsViewController.swift
//  apple-products
//
//  Created by Guilherme Viana on 15/11/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var screen: DetailsView?
    private var viewModel: DetailsViewModel = DetailsViewModel()
    
    override func loadView() {
        screen = DetailsView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        signProtocols()
    }
    
    private func signProtocols() {
        screen?.delegateTableView(delegate: self, dataSource: self)
    }

}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifier, for: indexPath) as? DetailsTableViewCell
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}
