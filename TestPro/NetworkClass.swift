//
//  NetworkClass.swift
//  TestPro
//
//  Created by Mohammad Tahreem Qadri on 07/08/21.
//

import SwiftUI

struct NetworkClass {
    
    @Binding var meals: Meals
    @Binding var isLoading: Bool
    func searchMeals(searchValue: String) {
        
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(searchValue)"
        guard let url = URL(string: urlString) else {return }
        
        URLSession.shared.dataTask(with: url){data, responseCode, error in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard (responseCode as? HTTPURLResponse) != nil else {
                print("response error: \(String(describing: error))")
                return
            }
            
            if let meals = try? JSONDecoder().decode(Meals.self, from: data!){
                DispatchQueue.main.async {
                    self.meals = meals
                    print(meals)
                }
            }else{
                print("There was an error: \(error.debugDescription)")
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    print("Error decoding: \(dictionary)")
                }
            }
        }.resume()
        
        
        return
    }
    
    func getRandomMeal()  {
        isLoading = true
        let urlString = "https://www.themealdb.com/api/json/v1/1/random.php"
        guard let url = URL(string: urlString) else {return }
        
        
        URLSession.shared.dataTask(with: url){data, responseCode, error in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard (responseCode as? HTTPURLResponse) != nil else {
                print("response error: \(String(describing: error))")
                return
            }
            
            if let meals = try? JSONDecoder().decode(Meals.self, from: data!){
                DispatchQueue.main.async {
                    self.meals = meals
                    print(self.meals)
                }
            }else{
                print("There was an error: \(error.debugDescription)")
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    print("Error decoding: \(dictionary)")
                }
            }
        }.resume()
        isLoading = false
        return
    }
}
