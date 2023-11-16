//
//  ContentView.swift
//  PremiumCard34ML
//
//  Created by Maged Mohamed on 15/11/2023.
//


//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack{
//            TabView {
//                // First Tab
//                Text("First Tab Content")
//                    .tabItem {
//                        Image(systemName: "1.circle.fill")
//                        Text("Tab 1")
//                    }
//                
//                // Second Tab
//                Text("Second Tab Content")
//                    .tabItem {
//                        Image(systemName: "2.circle.fill")
//                        Text("Tab 2")
//                    }
//            }
//        }
//        .accentColor(.blue)  // Set the color of the selected tab
//
//        // List of Cards
//        List {
//            CardView(title: "Card 1")
//            CardView(title: "Card 2")
//            // Add more cards as needed
//        }
//    }
//}
//
//struct CardView: View {
//    var title: String
//
//    var body: some View {
//        VStack {
//            Text(title)
//                .font(.title)
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//        }
//        .padding()
//    }
//}
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        NavigationView {
            TabView(selection: $viewModel.selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)

                CatalogView()
                    .tabItem {
                        Image(systemName: "rectangle.grid.1x2.fill")
                        Text("Catalog")
                    }
                    .tag(1)
            }
            .accentColor(.blue)  // Set the color of the selected tab
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                // Handle additional actions if needed
            }) {
                Image(systemName: "person.circle.fill")
            })
        }
        .environmentObject(viewModel)
    }
}


class ContentViewModel: ObservableObject {
    @Published var selectedTab: Int = 0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




#Preview {
    ContentView()
}
