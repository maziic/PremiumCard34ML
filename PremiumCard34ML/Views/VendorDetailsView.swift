//
//  VendorDetailsView.swift
//  PremiumCard34ML
//
//  Created by Maged Mohamed on 16/11/2023.
//

import SwiftUI

struct VendorDetailsView: View {
    let vendor: Vendor // Assuming you have a Vendor model with image, description, branches, etc.
    @State private var selectedBranchIndex = 0

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Image of the vendor
                Image(uiImage: UIImage(named: vendor.image) ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .clipped()

                // Description of the vendor
                Text(vendor.description)
                    .padding(.horizontal, 16)

                // Selector for branches
                Picker("Branches", selection: $selectedBranchIndex) {
                    ForEach(0..<vendor.branches.count, id: \.self) { index in
                        Text(vendor.branches[index].title)
                    }
                }
                .pickerStyle(DefaultPickerStyle())
                .frame(width: UIScreen.main.bounds.width * 0.90)
                .padding()
                .foregroundColor(.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke( lineWidth: 1)
                )

                // Display branch details based on the selected branch index
                Text(vendor.branches[selectedBranchIndex].locationText)
                    .padding(.horizontal, 16)
                
                // Other branch details or information
                // ...

                Spacer()
            }
        }
        .navigationBarTitle(Text("Vendor Details"), displayMode: .inline)
    }
}
