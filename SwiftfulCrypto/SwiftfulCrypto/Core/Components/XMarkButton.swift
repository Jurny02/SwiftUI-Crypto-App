//
//  XMarkButton.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 20/09/2026.
//

import SwiftUI

struct XMarkButton: View {
    let dismiss: () -> Void

    var body: some View {
        Button(
            action: {
                dismiss()
            },
            label: {
                Image(systemName: "xmark")
                    .font(.headline)
            }
        )
    }
}
