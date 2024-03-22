//
//  ContentView.swift
//  Woof-Companion-MVP
//
//  Created by François-Xavier on 22/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            
            HistoryView()
                .tabItem {
                    Label("Historique", systemImage: "list.bullet")
                }
                .tag(0)
            
            MainView()
                .tabItem {
                    Label("Accueil", systemImage: "house")
                }
                .tag(1)
            
            WalkView()
                .tabItem {
                    Label("Ballade", systemImage: "figure.walk.motion")
                }
                .tag(2)
            
        }
    }
}

#Preview {
    ContentView()
}
