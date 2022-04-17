//
//  ProductRepositoryProtocol.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 15/04/2022.
//

import Foundation

protocol ProductRepositoryProtocol {
    func fetchAllProductss(completion: @escaping(_ list: [Product]?, _ error: Error?) -> ())
}
