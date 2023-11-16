//
//  CategoryModel.swift
//  PremiumCard34ML
//
//  Created by Maged Mohamed on 15/11/2023.
//


import Foundation

struct Category: Codable {
    let id: String
    let title: String
    let description: String
    // Add other properties as per your API response
}
struct CategoryResponse: Decodable {
    let meta: MetaCategory
    let data: [Category]
    let pagination: Pagination
}

struct MetaCategory: Decodable {
    let code: Int
    let errors: [String]
    // Add other properties if needed
}

struct PaginationCategory: Decodable {
    // Add pagination properties if needed
}
