//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 16/09/2026.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
