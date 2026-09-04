//
//  CircleButtonView.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 04/09/2026.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background {
                Circle()
                    .foregroundStyle(Color.theme.background)
            }
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10
            )
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {

    Group {

        CircleButtonView(iconName: "info")
            .padding()

        CircleButtonView(iconName: "plus")
            .padding()
            .colorScheme(.dark)
    }
}
