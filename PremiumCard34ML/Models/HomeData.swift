//
//  HomeData.swift
//  PremiumCard34ML
//
//  Created by Maged Mohamed on 15/11/2023.
//

import Foundation

struct HomeData: Decodable {
    let homepage_slides: [SlideData]
    let offers: [Offer]
    let category: [Category]

    enum CodingKeys: String, CodingKey {
        case homepage_slides
        case offers
        case category
    }
}

