//
//  Suffer.swift
//  homework_13
//
//  Created by sugarbaron on 24.04.2021.
//

/** short-name variant: SUFFix + handlER = suffer */
final class Suffer {
    
    static func extract(from source: String) -> [String] {
        print("woo hoo")
        let suffixSize: Int = 3
        var suffixes: [String] = [ ]
        print("source size:\(source.count) start:\(source.count - suffixSize))")
        for i in stride(from: (source.count - suffixSize), through: 0, by: -1)  {
            print("i want from:\(i) to \(i+suffixSize)")
            suffixes.append( source.substring(i ..< i+suffixSize) )
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
