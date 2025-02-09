//
//  MapView.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 27.12.24..
//

import SwiftUI
import MapKit

struct MapView: View {
    let coordinate: CLLocationCoordinate2D
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
    var body: some View {
        Map(initialPosition: .region(region))
            .disabled(true)
    }
}

#Preview {
    MapView(coordinate: .init(latitude: 34.011_286, longitude: -116.166_868))
}
