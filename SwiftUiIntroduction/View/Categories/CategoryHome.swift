//
//  CategoryHome.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 15.2.25..
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[1].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { category in
                    CategoryRow(categoryName: category, landmarks: modelData.categories[category]!)
                }
                .listRowInsets(EdgeInsets())

            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select landmark")
        }
        
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
