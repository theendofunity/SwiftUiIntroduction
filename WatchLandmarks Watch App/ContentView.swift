//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by ddudkin on 16.2.25..
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(options: [.badge, .alert, .sound])
            }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
