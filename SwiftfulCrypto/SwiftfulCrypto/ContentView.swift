//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 03/09/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack(spacing: 25) {

                Text("AccentColor")
                    .foregroundStyle(Color.theme.accent)
                Text("BackgroundColor")
                    .foregroundStyle(Color.theme.background)
                Text("GreenColor")
                    .foregroundStyle(Color.theme.green)
                Text("RedColor")
                    .foregroundStyle(Color.theme.red)
                Text("SecondaryTextColor")
                    .foregroundStyle(Color.theme.secondaryText)

            }
            .font(.title2)
        }
    }
}

#Preview {
    ContentView()
}
