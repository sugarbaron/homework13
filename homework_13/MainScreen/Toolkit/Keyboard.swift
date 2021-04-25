//
//  Keyboard.swift
//  homework_13
//
//  Created by sugarbaron on 25.04.2021.
//

import SwiftUI

extension View {
    
    @discardableResult
    func hideKeyboardOnTap() -> some View { onTapGesture { hideKeyboard() } }
    
    func hideKeyboard() {
        // oh no, it's so ugly: selector, UIKit and bunch on nils
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil)
    }
    
}
