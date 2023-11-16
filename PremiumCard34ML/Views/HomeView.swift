//
//  HomeView.swift
//  PremiumCard34ML
//
//  Created by Maged Mohamed on 15/11/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()


    var body: some View {
        ScrollView{
            VStack {
                HomeCarouselView()
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                
                HomeCardListView(viewModel: homeViewModel)
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                Spacer()
            }
            .onAppear{
                viewModel.fetchCarouselSlides()
            }
        }

        .onAppear {
            // Additional setup if needed
        }
    }
}

struct HomeCarouselView: View {
    @State private var currentPage = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 32) {
                    ForEach(0..<3, id: \.self) { index in
                        CardView()
                    }
                }
                .padding()
                .frame(height: 200)
                .offset(x: CGFloat(currentPage) * -UIScreen.main.bounds.width - CGFloat((16 * currentPage)))
                .animation(.easeInOut)
                .onReceive(timer) { _ in
                    withAnimation {
                        currentPage = (currentPage + 1) % 3
                    }
                }
            }

            PageControl(numberOfPages: 3, currentPage: currentPage)
                .padding(.top, 8)
        }
    }
}
struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.blue)
            .frame(width: UIScreen.main.bounds.width - 16, height: 200)
            .overlay(
                Text("Card Content")
                    .foregroundColor(.white)
            )
    }
}

struct RemoteImage: View {
    let url: String
    @State private var image: UIImage? = nil

    var body: some View {
        if let uiImage = image {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .clipped()
        } else {
            Rectangle()
                .fill(Color.gray)
                .onAppear {
                    loadImage()
                }
        }
    }

    private func loadImage() {
        guard let imageURL = URL(string: url) else { return }
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}


struct PageControl: View {
    let numberOfPages: Int
    let currentPage: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages) { page in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(page == currentPage ? .yellow : .gray)
            }
        }
    }
}
struct HomeCardListView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Latest Offers")
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading, 16)

                VStack(spacing: 16) {
                    ForEach(0..<5) { index in
                        LatestOfferCardView()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 16)
            }
        
    }
}
struct LatestOfferCardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.green)
            .frame(width: UIScreen.main.bounds.width - 16, height: 200)
            .overlay(
                Text("Latest Offer")
                    .foregroundColor(.white)
            )
    }
}


// You may define your Card model here
struct Card {
    // Define properties for your card model
}
