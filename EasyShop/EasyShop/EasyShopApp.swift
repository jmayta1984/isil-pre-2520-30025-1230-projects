//
//  EasyShopApp.swift
//  EasyShop
//
//  Created by Jorge Mayta on 11/09/25.
//

import SwiftUI

@main
struct EasyShopApp: App {
    @StateObject var cartViewModel = CartViewModel()
    @StateObject var mainViewModel = MainViewModel()
    @StateObject var favoriteViewModel = FavoritesViewModel()

    var body: some Scene {
        WindowGroup {
            IntroView()
                .environmentObject(cartViewModel)
                .environmentObject(mainViewModel)
                .environmentObject(favoriteViewModel)
        }
    }
}
