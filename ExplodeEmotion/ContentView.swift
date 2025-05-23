//
//  ContentView.swift
//  ExplodeEmotion
//
//  Created by  Lucid on 5/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }.tag(0)
            
            HistoryView()
                .tabItem {
                    Image(systemName: "pentagon.fill")
                    Text("혜택")
                }.tag(1)
        }
    }
}

#Preview {
    ContentView()
}
