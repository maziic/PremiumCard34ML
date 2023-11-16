//
//  NetworkService.swift
//  PremiumCard34
//
import Foundation

class NetworkService {
    static let shared = NetworkService() // Singleton instance

    func fetchHomeData(completion: @escaping (Result<HomeData, Error>) -> Void) {
        // Implement the network request to fetch home data
        // Use the provided API endpoints (e.g., /homepage_slides, /offers?include=vendor)
        // Parse the response into the HomeData model
        // For simplicity, I'll assume a basic URLSession usage
        let homeDataURL = URL(string: "https://pc.34ml.com/api/v2/homepage_slides")!
        
        URLSession.shared.dataTask(with: homeDataURL) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            // Parse data into HomeData model
            do {
                let homeData = try JSONDecoder().decode(HomeData.self, from: data!)
                completion(.success(homeData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
