//
//  LandmarkDetail.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 2.2.25..
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    let landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex {
            $0.id == landmark.id
        }!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text(landmark.state)
                        .font(.subheadline)
                }
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
        .environment(ModelData())
}
