//
//  SuffixesViewerUi.swift
//  homework_13
//
//  Created by sugarbaron on 25.04.2021.
//

import SwiftUI

extension SuffixesViewer {
    
    struct Ui : View {
        
        @ObservedObject private var model: ViewModel
        
        init(_ model: ViewModel) {
            self.model = model
            hideKeyboardOnTap()
        }
        
        var body: some View {
            VStack {
                Picker("sort", selection: $model.desiredResultSet) {
                    Text("abc").tag(ResultSet.abc)
                    Text("top 10").tag(ResultSet.top10)
                }
                .frame(height: 30)
                .padding(15)
                .background(Color(red: 0.2, green: 0.6, blue: 0.9))
                .foregroundColor(.white)
                .pickerStyle(SegmentedPickerStyle())
                .cornerRadius(5)
                .hideKeyboardOnTap()
                
                List { ForEach(model.suffixes) { suffix in
                    Text(suffix)
                } }
                .background(Color.black)
                .cornerRadius(5)
                .hideKeyboardOnTap()
            }
        }
        
    }
    
}

extension String : Identifiable { public var id: String { UUID().uuidString } }

struct SuffixesViewer_Previews: PreviewProvider {
    
    static var previews: some View {
        SuffixesViewer.Ui(SuffixesViewer.ViewModel()).preferredColorScheme(.dark)
    }
    
}
