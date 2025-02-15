//
//  CategoryRow.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 15.2.25..
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var landmarks: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(landmarks) { landmark in
                        CategoryItem(landmark: landmark)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    
    CategoryRow(
        categoryName: landmarks.first!.name,
        landmarks: Array(landmarks.prefix(4))
    )
}
