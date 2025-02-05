//
//  LandmarkList.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 2.2.25..
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select Landmark")
        }

       
    }
}

#Preview {
    LandmarkList()
}
