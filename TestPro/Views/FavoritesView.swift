//
//  FavoritesView.swift
//  TestPro
//
//  Created by Mohammad Tahreem Qadri on 07/08/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites : FavoriteItems
    @State var favoriteList: [String] = []
    var body: some View {
        
        if favorites.favoriteItem.count >= 1 {
            List(favorites.favoriteItem, id:\.self){ favorite in
                Text(favorite.strMeal!)
                    .padding()
                    .foregroundColor(.yellow)
            }
        }else{
            Text("No Favorites Added")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
