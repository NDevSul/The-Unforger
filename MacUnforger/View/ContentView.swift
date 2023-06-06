//
//  ContentView.swift
//  MacUnforger
//
//  Created by MacBook Pro on 06/06/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: BattleView.ViewModel
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

