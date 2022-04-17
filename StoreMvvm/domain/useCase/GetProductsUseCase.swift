//
//  GetProductsUseCase.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 16/04/2022.
//

import Foundation

class GetProductsUseCase {
    
    //MARK: - Properties
    let productRepo: ProductRepositoryProtocol
    
    //MARK: - Initializers
    init(productRepo: ProductRepositoryProtocol = ProductsRepositoryImpl()) {
        self.productRepo = productRepo
    }
}

//MARK: - Functions
extension GetProductsUseCase {
    func fetchAllProducts(completion: @escaping HomeScreenViewModelHandler) {
        
        productRepo.fetchAllProductss { products, error in
            if let products = products {
                completion(.ListOfProducts(products))
            } else if let error = error {
                completion(.Failure(error.localizedDescription))
            }
        }
    }
}
