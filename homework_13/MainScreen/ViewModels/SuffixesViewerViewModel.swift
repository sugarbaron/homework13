//
//  SuffixesViewerViewModel.swift
//  homework_13
//
//  Created by sugarbaron on 25.04.2021.
//

import SwiftUI

/* namespace class */
final class SuffixesViewer { }

extension SuffixesViewer {
    
    final class ViewModel : ObservableObject {
        
        @Published var suffixes: [String] = .init()
        @Published var desiredResultSet: ResultSet = .top10
        
        var list: [Calculation] { desiredResultSet == .abc ? abc : top10 }
        
        var abc: [Calculation] { suffixes.sorted().map { Calculation($0, -1) } }
        
        var top10: [Calculation] {
            let calculations: [Calculation] = calculateSuffixes()
            let size = calculations.count > 9 ? 10 : calculations.count
            return Array(calculations.sorted().prefix(size))
        }
        
        private func calculateSuffixes() -> [Calculation] {
            var calculations: [Calculation] = .init()
            var unprocessed: [String] = suffixes
            while ( unprocessed.isEmpty == false ) {
                guard let current: String = unprocessed.first else { return calculations }
                let number: Int = unprocessed.filter { $0 == current }.count
                calculations += [Calculation(current, number)]
                unprocessed.removeAll { $0 == current }
            }
            return calculations
        }
        
    }
    
    enum ResultSet { case abc; case top10 }
    
}

final class Calculation : Comparable, Identifiable {
    
    let suffix: String
    let number: Int
    let id: String = UUID().uuidString
    
    init(_ suffix: String, _ number: Int) {
        self.suffix = suffix
        self.number = number
    }
    
    static func < (lhs: Calculation, rhs: Calculation) -> Bool {
        if lhs.number == rhs.number { return lhs.suffix < rhs.suffix }
        return lhs.number > rhs.number
    }
    
    static func == (lhs: Calculation, rhs: Calculation) -> Bool {
        (lhs.number == rhs.number) && (lhs.suffix == rhs.suffix)
    }
    
}
