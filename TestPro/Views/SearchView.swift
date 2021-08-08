//
//  SearchView.swift
//  TestPro
//
//  Created by Mohammad Tahreem Qadri on 07/08/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchFoodItem: String = ""
    @State var searchList : [String] = []
    @State var searchCardList: [MealsList] = []
    @State var meals : Meals = Meals()
    @State var loadingBool: Bool = false
    var body: some View {
        VStack{
            TextField("Search", text: $searchFoodItem)
                .onChange(of: searchFoodItem, perform: {
                    newvalue in
                    NetworkClass(meals: $meals, isLoading: $loadingBool).searchMeals(searchValue: newvalue)
                })
                .padding()
                .background(Color.secondary)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
                .keyboardType(.alphabet)
            Spacer()
            if loadingBool {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                Spacer()
            } else {
                if meals.meals != nil && !meals.meals!.isEmpty {
                    List(meals.meals!, id: \.self){ searchItem in
                        SearchViewCard(urlString: searchItem.strMealThumb!, mealName: searchItem.strMeal!)
                    }
                }
            }
        }
    }
    
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
//        SearchView()
        SearchViewCard(urlString: "https://www.themealdb.com/images/media/meals/xxpqsy1511452222.jpg", mealName: "Matar Paneer")
    }
}


struct SearchViewCard: View {
    @State var urlString: String
    @State var mealName: String
    @State var isFav: Bool = false
    @EnvironmentObject var favItem : FavoriteItems
    var body: some View{
        
        HStack{
            
            WebView(request: URLRequest(url: URL(string: urlString)!))
                .frame(width: 70, height: 70)
                .cornerRadius(8)
                .padding()
            
            Text(mealName)
            Spacer()
            Image(systemName: isFav ?  "star.fill" : "star")
                .padding()
                .onTapGesture {
                    isFav.toggle()
                    if !isFav {
                        favItem.favoriteItem.remove(at: favItem.favoriteItem.firstIndex(of: MealsList(strMealThumb: urlString, strMeal: mealName))!)
                    }else{
                        favItem.favoriteItem.append(MealsList(
                                                        strMealThumb: urlString,
                                                        strMeal: mealName))
                    }
                }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}
