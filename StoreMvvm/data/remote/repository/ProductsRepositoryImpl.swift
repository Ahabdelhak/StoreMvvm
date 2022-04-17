//
//  ProductssRepositoryImpl.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 16/04/2022.
//

import Foundation


import Foundation

class ProductsRepositoryImpl {
    
    let networkClient : NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {
        self.networkClient = networkClient
    }
    
}
extension ProductsRepositoryImpl: ProductRepositoryProtocol  {
    
    func fetchAllProductss(completion: @escaping ([Product]?, Error?) -> ()) {
        guard let url = StoreEndpoints.getAllProducts.url() else {
            completion(nil, NetworkError.invalidURL)
            return
        }
        networkClient.sendRequestViaURL(url: url) { data, response, error in
            if let data = data {
                let decodedResponse = JSONCodable.decode(jsonData: data, usingModel: [Product].self)
                switch decodedResponse {
                    case .success(let responseString):
                        completion(responseString, nil)
                    case .failure:
                        completion(nil, NetworkError.jsonDecodingError)
                }
            }
            if let error = error {
                completion(nil, NetworkError.thrownError(error.localizedDescription))
            }
        }
    }
}
