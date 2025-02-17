//
//  ContentView.swift
//  MacLandmarks
//
//  Created by ddudkin on 16.2.25..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
