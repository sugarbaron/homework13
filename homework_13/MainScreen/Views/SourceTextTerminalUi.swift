//
//  SourceTextTerminal.swift
//  homework_13
//
//  Created by sugarbaron on 25.04.2021.
//

import SwiftUI

extension SourceTextTerminal {
    
    struct Ui : View {
        
        @ObservedObject private var model: ViewModel
        
        init(_ model: ViewModel) {
            self.model = model
            UITextView.appearance().backgroundColor = .clear
            hideKeyboardOnTap()
        }
        
        var body: some View {
            HStack {
                TextEditor(text: $model.sourceText)
                    .frame(height: 70)
                    .foregroundColor(.black)
                    .background(Color(red: 0.85, green: 0.8, blue: 0.65))
                    .cornerRadius(5)
                Button("split") {
                    hideKeyboard()
                    model.buttonTapped(model.sourceText)
                }
                .frame(width: 70, height: 70)
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(5)
            }
            .padding(0)
            .hideKeyboardOnTap()
        }
        
    }
    
}

struct SourceTextTerminal_Previews: PreviewProvider {
    
    static var previews: some View {
        SourceTextTerminal.Ui(SourceTextTerminal.ViewModel()).preferredColorScheme(.dark)
    }
    
}
