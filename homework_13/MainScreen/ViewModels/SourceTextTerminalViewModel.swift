//
//  SourceTextTerminalViewModel.swift
//  homework_13
//
//  Created by sugarbaron on 25.04.2021.
//

import SwiftUI

/* namespace class */
final class SourceTextTerminal { }

extension SourceTextTerminal {
    
    final class ViewModel : ObservableObject {
        
        @Published var sourceText: String = "aaaaa bbbbb cccc ddd" { didSet { SharedStorage.sourceText = sourceText } }
        
        var buttonTapped: (String) -> Void = { _ in }
        
        init() { SharedStorage.sourceText = sourceText }
        
    }
    
}
