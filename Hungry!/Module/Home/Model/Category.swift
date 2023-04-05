//
//  Category.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 24/03/2023.
//

import Foundation



struct Category: Decodable {

    var browseCategories: [BrowsCategories]?
    var shoppingCategories: [ShoppinCategories]?

    private enum CodingKeys: String, CodingKey {
            case browseCategories = "browse-categories"
            case shoppingCategories = "shopping-categories"
        }
}




struct BrowsCategories: Decodable {

    let promoted: Bool
    let id: String
    let display: Display
    let content: Content
    let type: String?
    
   
    private enum CodingKeys: String, CodingKey {
        case promoted = "promoted"
        case id = "tracking-id"
        case display = "display"
        case content = "content"
        case type = "type"
    }
}

struct Display: Decodable {

    let displayName: String?
    let iconImage: String?
    let categoryImage: String?
    let tag: String?

}
struct ShoppinCategories:Decodable {

    let promoted: Bool?
    let id: String?
    let display: Display
    let content: Content
    let type: String?

    private enum CodingKeys: String, CodingKey {
            case promoted = "promoted"
            case id = "tracking-id"
            case display = "display"
            case content = "content"
            case type = "type"
        }
}

struct Content: Codable {

}
