//
//  NetworkClient.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 15/04/2022.
//

import Foundation


protocol NetworkClientProtocol {
    func sendRequestViaURL(url: URL?, completion: @escaping(Data?, URLResponse?, Error?) -> ())
    func sendRequestViaURLRequest(request: URLRequest, completion: @escaping(Data?, URLResponse?, Error?) -> ())
}

class NetworkClient {
    static let sharedInstance = NetworkClient()
    let session : URLSession!
    
    init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
}

extension NetworkClient: NetworkClientProtocol {
    func sendRequestViaURL(url: URL?, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let url = url else {
            completion(nil, nil, NetworkError.invalidURL)
            return
        }
        session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }.resume()
    }
    func sendRequestViaURLRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        session.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
}



enum NetworkError: Swift.Error {
    case jsonParsingError
    case invalidURL
    case thrownError(String)
    case jsonToDataError
    case jsonDecodingError
    case jsonEncodingError
}
