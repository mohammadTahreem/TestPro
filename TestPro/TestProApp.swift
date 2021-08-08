//
//  TestProApp.swift
//  TestPro
//
//  Created by Mohammad Tahreem Qadri on 07/08/21.
//

import SwiftUI

@main
struct TestProApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabViewStruct()
                .environmentObject(FavoriteItems())
        }
    }
}
