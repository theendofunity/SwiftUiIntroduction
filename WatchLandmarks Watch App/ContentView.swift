//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by ddudkin on 16.2.25..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
