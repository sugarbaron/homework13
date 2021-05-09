//
//  SharedStorage.swift
//  homework_13
//
//  Created by sugarbaron on 09.05.2021.
//

import Foundation
import WidgetKit

final class SharedStorage {
    
    private static let sharedStorage = UserDefaults(suiteName: suiteName)
    
    private static let suiteName = "group.homework13"
    
    static var sourceText: String {
        get { sharedStorage?.string(forKey: SharedStorage.Key.sourceText.key) ?? "" }
        set { sharedStorage?.set(newValue, forKey: SharedStorage.Key.sourceText.key) }
    }
    
    static let splitRequest = URL(string: "hw:///splitRequest")
    
    enum Key : String {
        
        case sourceText = "sourceText"
        
        var key: String { rawValue }
        
    }
}
