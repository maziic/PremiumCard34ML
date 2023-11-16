//
//  VendorModel.swift
//  PremiumCard34ML
//
//  Created by Maged Mohamed on 15/11/2023.
//

import Foundation


struct Vendor {
    let image: String
    let description: String
    let branches: [Branch]
}

struct Branch {
    let title: String
    let locationText: String
}

extension Vendor {
    static func dummyData() -> Vendor {
        let dummyVendor = Vendor(
            image: "https://premiumcard-production.s3.eu-central-1.amazonaws.com/vendors/November2021/0xBD8jy4ZoxxLNREpha0.png",
            description: "This is a sample vendor description. Replace it with your actual vendor description.",
            branches: [
                Branch(title: "Branch 1", locationText: "Location 1"),
                Branch(title: "Branch 2", locationText: "Location 2"),
                Branch(title: "Branch 3", locationText: "Location 3")
            ]
        )
        return dummyVendor
    }
}
