//
//  HomeScreenViewModelStates.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 16/04/2022.
//

import Foundation

//MARK: - ViewModel States
enum HomeScreenViewModelStates {
    case ListOfProducts([Product])
    case Failure(String)
}
typealias HomeScreenViewModelHandler = (HomeScreenViewModelStates) -> Void

class HomeScreenViewModel {
    
    //MARK: - Properties
    let productsUseCase: GetProductsUseCase
    
    //MARK: - Init
    init(productsUseCase: GetProductsUseCase = GetProductsUseCase()) {
        self.productsUseCase = productsUseCase
    }
}

//MARK: - Functions
extension HomeScreenViewModel {
    func fetchAllProducts(completion:@escaping HomeScreenViewModelHandler) {
        productsUseCase.fetchAllProducts { result in
            completion(result)
        }
    }
}
