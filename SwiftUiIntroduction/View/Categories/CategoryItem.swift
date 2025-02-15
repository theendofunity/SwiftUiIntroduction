//
//  CategoryItem.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 15.2.25..
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 135, height: 135)
                .clipShape(.rect(cornerRadius: 5))
            
            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks.first!)
}
