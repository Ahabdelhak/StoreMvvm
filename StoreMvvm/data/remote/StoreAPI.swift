//
//  API.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 15/04/2022.
//

import Foundation

//MARK: - FusionInspect Base URL
struct StoreAPI {
    static let baseURL = "https://fakestoreapi.com/"
}

//MARK: - URLConvertible
protocol URLConvertible {
    func url() -> URL?
}

//MARK: - FusionInspect Endpoints
enum StoreEndpoints {
    case getAllProducts
    case getProductDetails(productId:String)
}

//MARK: - FusionInspect Endpoint Extension
extension StoreEndpoints: URLConvertible {
    
    func url() -> URL? {
        switch self {
        case .getAllProducts:
            let endPoint = "products"
            return URL(string: "\(StoreAPI.baseURL)\(endPoint)")
            
        case .getProductDetails(let productId):
            let endPoint = "/rockets/\(productId)"
            return URL(string: "\(StoreAPI.baseURL)\(endPoint)")
        
        }
    }
}

//MARK: - HTTPMethods
enum HTTPMethod: String {
    case Get = "GET"
    case Post = "POST"
}

//MARK: - HTTPHeaderFields
enum HTTPHeaderField: String {
    case Authorization = "Authorization"
    case ContentType   = "Content-Type"
    case Accept        = "Accept"
}

