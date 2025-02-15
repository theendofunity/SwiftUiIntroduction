//
//  Landmark.swift
//  SwiftUiIntroduction
//
//  Created by ddudkin on 2.2.25..
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    struct Coordinates: Hashable, Codable {
        let latitude: Double
        let longitude: Double
    }
    
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    let name: String
    let id: Int
    let city: String
    let state: String
    let park: String
    let description: String
    var isFavorite: Bool
    var category: Category
    var isFeatured: Bool
    
    private let imageName: String
    private let coordinates: Coordinates
    
    var image: Image {
        Image(imageName)
    }
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
