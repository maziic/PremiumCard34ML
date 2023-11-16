//
//  CatalogView.swift
//  PremiumCard34ML
//
//  Created by Maged Mohamed on 15/11/2023.
//

import SwiftUI

struct CatalogView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16) {
                Text("Catalogue")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        // List of categories (Text or Button views)
                        ForEach(0..<10) { index in
                            CategoryView(categoryName: "Category \(index + 1)")
                        }
                    }
                    .padding(.horizontal, 5)
                }
                
                HStack(spacing: 16) {
                    // Icons (Image views or custom icons)
                    ForEach(0..<5) { index in
                        IconView(iconName: "icon\(index + 1)")
                            .frame(width: 60, height: 50)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom,20)
                
                // Grid view with vendors (replace with your data)
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                    ForEach(0..<10) { index in
                        NavigationLink(destination: VendorDetailsView(vendor: Vendor.dummyData())) {
                              VendorView(vendorName: "Vendor \(index + 1)")
                          }                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}

struct CategoryView: View {
    var categoryName: String
    
    var body: some View {
        Text(categoryName)
            .padding()
//            .background(Color.red)
            .cornerRadius(8)
    }
}

struct IconView: View {
    var iconName: String
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.black)
            .frame(width: 60, height: 60)
            .overlay(
                Text(iconName)
                    .foregroundColor(.white)
            )
    }
}

struct VendorView: View {
    var vendorName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.green)
            .frame(width: UIScreen.main.bounds.width / 2.2, height: 150)
            .overlay(
                Text(vendorName)
                    .foregroundColor(.white)
            )
    }
}
