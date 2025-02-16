//
//  PageView.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 16.2.25..
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page] = []
    @State private var currentPage: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    let pages = ModelData().features.map { landmark in
        FeatureCard(landmark: landmark)
    }
    return PageView(pages: pages)
}
