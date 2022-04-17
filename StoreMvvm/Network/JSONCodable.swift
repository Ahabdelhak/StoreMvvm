//
//  JSONCodable.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 15/04/2022.
//

import Foundation

class JSONCodable {
    static func decode<T: Decodable>(jsonData: Data, usingModel modelType: T.Type) -> Result<T?, NetworkError> {
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode(modelType, from: jsonData)
            return .success(model)
        } catch {
            return .failure(.jsonDecodingError)
        }
    }
    static func encode<T: Encodable>(model: T) -> Result<Data?, NetworkError> {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(model)
            return .success(encodedData)
        } catch {
            return .failure(.jsonDecodingError)
        }
    }
}
