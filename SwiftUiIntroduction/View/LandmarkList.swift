//
//  LandmarkList.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 2.2.25..
//

import SwiftUI

struct LandmarkList: View {
    @State private var showOnlyFavorites: Bool = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmart in
            !showOnlyFavorites || landmart.isFavorite
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showOnlyFavorites) {
                    Text("Show only favorites")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: showOnlyFavorites)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
