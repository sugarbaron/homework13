//
//  MainScreen.swift
//  homework_13
//
//  Created by sugarbaron on 17.04.2021.
//

import SwiftUI

struct MainScreen : View {
    
    private var terminalModel: SourceTextTerminal.ViewModel
    private var suffixesViewerModel: SuffixesViewer.ViewModel
    
    init(_ terminalModel: SourceTextTerminal.ViewModel,
         _ suffixesViewerModel: SuffixesViewer.ViewModel) {
        self.terminalModel = terminalModel
        self.suffixesViewerModel = suffixesViewerModel
        terminalModel.buttonTapped = { sourceText in
            suffixesViewerModel.suffixes = Suffer.extract(from: sourceText)
        }
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 3)
            
            Text("suffix extractor 9000")
                .font(.title)
                .foregroundColor(.yellow)
                .hideKeyboardOnTap()
            
            SourceTextTerminal.Ui(terminalModel)
            
            SuffixesViewer.Ui(suffixesViewerModel)
            
            Spacer().frame(height: 3)
        }
        .padding(10)
        .background(Color(red: 0.25, green: 0.25, blue: 0.25))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainScreen(SourceTextTerminal.ViewModel(),
                   SuffixesViewer.ViewModel())
            .preferredColorScheme(.dark)
    }
    
}
