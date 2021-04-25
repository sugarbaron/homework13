//
//  SuffixesViewerViewModel.swift
//  homework_13
//
//  Created by sugarbaron on 25.04.2021.
//

import SwiftUI

extension SuffixesViewer {
    
    final class ViewModel : ObservableObject {
        
        @Published var suffixes: [String] = .init()
        @Published var desiredResultSet: ResultSet = .top10
        
    }
    
    enum ResultSet { case abc; case top10 }
    
}
