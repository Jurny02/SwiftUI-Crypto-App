//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 03/09/2026.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {

    @StateObject private var vm = HomeViewModel()

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
