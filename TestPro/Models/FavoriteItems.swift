//
//  FavoriteItems.swift
//  TestPro
//
//  Created by Mohammad Tahreem Qadri on 08/08/21.
//

import Foundation
import Combine

final class FavoriteItems: ObservableObject {
    @Published var favoriteItem: [MealsList] = []
    
}
