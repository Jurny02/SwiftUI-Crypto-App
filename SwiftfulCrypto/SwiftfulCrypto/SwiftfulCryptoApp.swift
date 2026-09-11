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
