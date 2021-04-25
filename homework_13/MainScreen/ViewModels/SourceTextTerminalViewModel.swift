//
//  SourceTextTerminalViewModel.swift
//  homework_13
//
//  Created by sugarbaron on 25.04.2021.
//

import SwiftUI

extension SourceTextTerminal {
    
    final class ViewModel : ObservableObject {
        
        @Published var sourceText: String = "1"
        var buttonTapped: (String) -> Void = { _ in }
        
    }
    
}
