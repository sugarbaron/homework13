//
//  MainScreen.swift
//  homework_13
//
//  Created by sugarbaron on 17.04.2021.
//

import SwiftUI
//import UIKit

struct MainScreen : View {
    
    @State var foo: String = "alphabetic"
    @State var bar: String = "source text"
    @State var suffixes: [String] = [ ]
    
    init() { UITextView.appearance().backgroundColor = .clear }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 3)
            
            Text("suffix extractor 9000")
                .font(.title)
                .foregroundColor(.yellow)
            
            HStack {
                TextEditor(text: $bar)
                    .frame(height: 70)
                    .foregroundColor(.black)
                    .background(Color(red: 0.85, green: 0.8, blue: 0.65))
                    .cornerRadius(5)
                Button("split") {
                    /* todo: split text into suffixes */
                    hideKeyboard()
                    split(bar)
                }
                .frame(width: 70, height: 70)
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(5)
            }
            .padding(0)
            
            Picker("sort", selection: $foo) {
                Text("abc").tag("alphabetic")
                Text("123").tag("quantity")
            }
            .frame(height: 30)
            .padding(15)
            .background(Color(red: 0.2, green: 0.6, blue: 0.9))
            .foregroundColor(.white)
            .pickerStyle(SegmentedPickerStyle())
            .cornerRadius(5)
            
            List { ForEach(suffixes) { suffix in
                Text(suffix)
            } }
            .background(Color.black)
            .cornerRadius(5)
            
            Spacer().frame(height: 3)
        }
        .padding(10)
        .background(Color(red: 0.25, green: 0.25, blue: 0.25))
    }
    
    private func hideKeyboard() {
        // oh no, it's so ugly!
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil)
    }
    
    private func split(_ sourceText: String) {
        print("tapped")
        suffixes = Suffer.extract(from: sourceText)
        suffixes.forEach {
            print($0)
        }
    }
    
}

extension String : Identifiable { public var id: String { UUID().uuidString } }

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View { MainScreen() }
    
}
