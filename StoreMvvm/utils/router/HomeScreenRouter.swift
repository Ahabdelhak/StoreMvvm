//
//  HomeScreenRouter.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 15/04/2022.
//

import Foundation

//MARK: - HomeScreenRouter Protocol
protocol HomeScreenRouterProtocol {
    var viewController: HomeViewController? { get }
    func navigateToDetailController(withProduct product: Product)
}

class HomeScreenRouter {
    
    //MARK: - Properties
    weak var viewController: HomeViewController?
}

//MARK: - HomeScreenRouter Implementation
extension HomeScreenRouter: HomeScreenRouterProtocol {
    func navigateToDetailController(withProduct product: Product) {
        if let viewController = viewController {
            let controller = DetailViewController(product: product)
            viewController.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
