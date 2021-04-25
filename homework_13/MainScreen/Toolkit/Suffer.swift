//
//  Suffer.swift
//  homework_13
//
//  Created by sugarbaron on 24.04.2021.
//

/** SUFFER means SUFFix + decomposER */
final class Suffer {
    
    static func extract(from source: String) -> [String] {
        let words: [String] = source.split(separator: " ").map { String($0) }
        var suffixes: [String] = [ ]
        words.forEach { suffixes.append(contentsOf: extractFrom(word: $0)) }
        return suffixes
    }
    
    private static func extractFrom(word: String) -> [String] {
        let suffixSize: Int = 3
        var suffixes: [String] = [ ]
        for i in stride(from: (word.count - suffixSize), through: 0, by: -1)  {
            suffixes.append( word.substring(i ..< i+suffixSize) )
        }
        return suffixes
    }
    
}

extension String {
    
    func index(from: Int) -> Index {
        
        index(startIndex, offsetBy: from) }
    
    func substring(_ r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
}
