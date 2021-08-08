//
//  RandomImageResponse.swift
//  TestPro
//
//  Created by Mohammad Tahreem Qadri on 07/08/21.
//

import Foundation

struct MealsList: Codable, Hashable {
    var strMealThumb: String?
    var strMeal: String?
    var strInstructions: String?
}

struct Meals: Codable, Hashable {
    var meals: [MealsList]?
}
