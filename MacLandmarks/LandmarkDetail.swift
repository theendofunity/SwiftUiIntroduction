//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by ddudkin on 16.2.25..
//

import SwiftUI
import MapKit

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
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: landmark.locationCoordinates)
                    .frame(height: 300)
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinates))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 24) {
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                                .font(.subheadline)
                            
                            Text(landmark.state)
                                .font(.subheadline)
                        }
                    }
                }
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
        .environment(ModelData())
        .frame(width: 850, height: 700)
}
