//
//  HomeViewModel.swift
//  PremiumCard34ML
//


import Foundation

class HomeViewModel: ObservableObject {
    @Published var slides: [SlideData] = []
    @Published var offers: [Offer] = []


    func fetchCarouselSlides() {
        guard let url = URL(string: "https://pc.34ml.com/api/v2/homepage_slides") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let slidesResponse = try JSONDecoder().decode(SlidesResponse.self, from: data)
                DispatchQueue.main.async {
                    self.slides = slidesResponse.data
                }
            } catch {
                print("Error decoding carousel slides: \(error)")
            }
        }.resume()
    }
    
    func fetchOffers() {
        guard let url = URL(string: "https://pc.34ml.com/api/v2/offers?include=vendor") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let offersResponse = try JSONDecoder().decode(OfferResponse.self, from: data)
                DispatchQueue.main.async {
                    self.offers = offersResponse.data
                }
            } catch {
                print("Error decoding offers: \(error)")
            }
        }.resume()
    }
}

//    func fetchCarouselSlides() {
        // Fetch data from the API endpoint pc.34ml.com/api/v2/homepage_slides
        // Decode the fetched data into an array of HomePageSlide
        // Assign the fetched data to carouselSlides
//    }


//    func fetchData() {
//        // Call the network service to fetch data for slider and latest offers
//        // Update sliderData and latestOffers once data is fetched
//        // For simplicity, I'll assume you have a NetworkService class
//        NetworkService.shared.fetchHomeData { [weak self] result in
//            switch result {
//            case .success(let homeData):
//                self?.sliderData = homeData.slider
//                self?.latestOffers = homeData.latestOffers
//                // Notify the view controller that data has been updated (using a delegate or closure)
//            case .failure(let error):
//                print("Error fetching home data: \(error.localizedDescription)")
//            }
//        }
//    }

    
