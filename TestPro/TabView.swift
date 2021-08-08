//
//  TabView.swift
//  TestPro
//
//  Created by Mohammad Tahreem Qadri on 07/08/21.
//

import SwiftUI

struct TabViewStruct: View {
    var body: some View {
        NavigationView{
        TabView {
            ContentView()
                .tabItem {
                    Label("Random", systemImage: "text.below.photo")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorite", systemImage: "star")
                }
        }
        .navigationBarTitle(Text("Foody Cook Book"))
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewStruct()
    }
}
