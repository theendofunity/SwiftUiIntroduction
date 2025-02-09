//
//  SwiftUiIntroductionApp.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 27.12.24..
//

import SwiftUI

@main
struct SwiftUiIntroductionApp: App {
    @State private var data = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(data)
        }
    }
}
