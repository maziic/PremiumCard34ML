//
//  OfferModel.swift
//  PremiumCard34ML
//
//  Created by Maged Mohamed on 15/11/2023.
//

import Foundation

struct Offer: Codable {
    let id: String
    let title: String
    let description: String
    // Add other properties as per your API response
}
struct OfferResponse: Decodable {
    let meta: MetaOffer
    let data: [Offer]
    let pagination: Pagination
}

struct MetaOffer: Decodable {
    let code: Int
    let errors: [String]
    // Add other properties if needed
}

struct PaginationOffer: Decodable {
    // Add pagination properties if needed
}
