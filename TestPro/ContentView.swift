//
//  ContentView.swift
//  TestPro
//
//  Created by Mohammad Tahreem Qadri on 07/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var meals : Meals = Meals()
    @State var loadingBool: Bool = true
    @EnvironmentObject var favItem : FavoriteItems
    @State var isFav: Bool = false
    
    var body: some View {
        VStack{
            if loadingBool {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .onAppear(){
                        NetworkClass(meals: $meals, isLoading: $loadingBool).getRandomMeal()
                    }
            }
            else{
                if meals.meals != nil && !meals.meals!.isEmpty {
                    Image(systemName: "person.fill")
                        .data(url: URL(string: meals.meals![0].strMealThumb!)!)
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    HStack{
                        Text(meals.meals![0].strMeal!)
                            .font(.title)
                            .foregroundColor(.red)
                            .bold()
                        Spacer()
                        Image(systemName: isFav ? "star.fill" : "star")
                            .onTapGesture {
                                isFav.toggle()
                                if !isFav {
                                    favItem.favoriteItem.remove(at: favItem.favoriteItem.firstIndex(of: MealsList(
                                                                                                        strMealThumb: meals.meals![0].strMealThumb!,
                                                                                                        strMeal:
                                                                                                            meals.meals![0].strMeal!) )!)
                                } else {
                                    favItem.favoriteItem.append(MealsList(
                                                    strMealThumb: meals.meals![0].strMealThumb!,
                                                    strMeal:
                                                        meals.meals![0].strMeal!))
                                }
                            }
                    }
                    .padding()
                    Spacer()
                }else{
                    Text("Meal Name")
                        
                    Image(systemName: "text.below.photo")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    
                }
            }
        }
        .padding()
    }
    
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(meals: Meals(meals: [MealsList(strMealThumb: "text.below.photo", strMeal: "Chicken Thai")]), loadingBool: false)
            
            
    }
}


extension Image{
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self.resizable()
    }
}
