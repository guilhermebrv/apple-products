//
//  DetailsViewController.swift
//  apple-products
//
//  Created by Guilherme Viana on 15/11/2023.
//

import UIKit

enum productTypes: Int {
    case mac = 1
    case ipad = 2
    case iphone = 3
    case watch = 4
    case vision = 5
    case airpods = 6
    case tvhome = 7
}

protocol DetailsViewControllerProtocol: AnyObject {
    func modalViewControllerDidDismiss()
}

class DetailsViewController: UIViewController {
    weak var delegate: DetailsViewControllerProtocol?
    private var screen: DetailsView?
    private var viewModel: DetailsViewModel
    
    required init(product: ProductsList) {
        viewModel = DetailsViewModel(product: product)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = DetailsView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        signProtocols()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        dismiss(animated: true) {
            self.delegate?.modalViewControllerDidDismiss()
        }
    }
}

extension DetailsViewController {
	private func signProtocols() {
		screen?.delegateTableView(delegate: self, dataSource: self)
		screen?.delegate(delegate: self)
	}
	
	private func setProductNameAndType() {
		screen?.productLabel.text = viewModel.product.productName
		switch productTypes(rawValue: viewModel.product.type ?? 0) {
		case .mac:
			screen?.productTypeLabel.text = "Mac"
		case .ipad:
			screen?.productTypeLabel.text = "iPad"
		case .iphone:
			screen?.productTypeLabel.text = "iPhone"
		case .watch:
			screen?.productTypeLabel.text = "Watch"
		case .vision:
			screen?.productTypeLabel.text = "Vision"
		case .airpods:
			screen?.productTypeLabel.text = "Airpods"
		case .tvhome:
			screen?.productTypeLabel.text = "TV & Home"
		default:
			return
		}
	}
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifier, for: indexPath) as? DetailsTableViewCell
        setProductNameAndType()
        cell?.setupCell(product: viewModel.product, delegate: self)
        if viewModel.isProductFavorited(product: viewModel.product) {
            cell?.productIsFavorited()
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(width: tableView.frame.width)
    }
}

extension DetailsViewController: DetailsTableViewViewProtocol {
    func tappedFavoritesButton() {
		viewModel.isProductFavorited(product: viewModel.product) ? viewModel.removeFromFavoritesData(data: viewModel.product) : viewModel.saveFavoriteToData(data: viewModel.product)
    }
    
    func buttonOpenURL(url: String) {
        if let buyURL: URL = URL(string: url) {
            UIApplication.shared.open(buyURL, options: [:], completionHandler: nil)
        }
    }
}

extension DetailsViewController: DetailsViewProtocol {
    func tappedExit() {
        dismiss(animated: true)
    }
}
