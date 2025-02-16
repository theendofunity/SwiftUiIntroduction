//
//  CategoryHome.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 15.2.25..
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0)})
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { category in
                    CategoryRow(categoryName: category, landmarks: modelData.categories[category]!)
                }
                .listRowInsets(EdgeInsets())

            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }

        } detail: {
            Text("Select landmark")
        }
        
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
