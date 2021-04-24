//
//  MainScreen.swift
//  homework_13
//
//  Created by sugarbaron on 17.04.2021.
//

import SwiftUI

struct MainScreen: View {
    
    init() { UITextView.appearance().backgroundColor = .clear }
    
    @State var shit: String = "alphabetic"
    
    var body: some View {
        VStack {
            Spacer().frame(height: 3)
            Text("suffix extractor 9000")
                .font(.title)
                .foregroundColor(.yellow)
            HStack {
                TextEditor(text: .constant("enter some text"))
                    .frame(height: 70)
                    .foregroundColor(.black)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.9))
                    .cornerRadius(5)
                Button("split") { /* todo: split text into suffixes */ }
                    .frame(width: 70, height: 70)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(5)
            }
            .padding(0)
            
            Picker("sort", selection: $shit) {
                Text("abc").tag("alphabetic")
                Text("123").tag("quantity")
            }
            .frame(height: 30)
            .padding(15)
            .background(Color(red: 0.2, green: 0.6, blue: 0.9))
            .foregroundColor(.white)
            .pickerStyle(SegmentedPickerStyle())
            .cornerRadius(5)
            
            List {
                
            }
            .background(Color.black)
            .cornerRadius(5)
            
            Spacer().frame(height: 3)
        }
        .padding(10)
        .background(Color(red: 0.25, green: 0.25, blue: 0.25))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View { MainScreen() }
    
}
