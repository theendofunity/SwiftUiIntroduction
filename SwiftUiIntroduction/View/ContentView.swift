//
//  ContentView.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 27.12.24..
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case featured
        case list
    }
    
    @State private var selectedTab: Tab = .featured
    
    var body: some View {
        TabView {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
