//
//  SliderModel.swift
//  PremiumCard34ML
//
//  Created by Maged Mohamed on 15/11/2023.
//

import Foundation


struct SlideData: Decodable {
    let title: String
    let picture: String
    // Add other properties if needed
}

struct SlidesResponse: Decodable {
    let meta: Meta
    let data: [SlideData]
    let pagination: Pagination
}

struct Meta: Decodable {
    let code: Int
    let errors: [String]
    // Add other properties if needed
}

struct Pagination: Decodable {
    // Add pagination properties if needed
}

