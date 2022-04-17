//
//  Products.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 15/04/2022.
//

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let welcomeDescription: String
    let category: Category
    let image: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case welcomeDescription = "description"
        case category, image, rating
    }
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

typealias products = [Product]
