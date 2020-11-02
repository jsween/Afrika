//
//  MapView.swift
//  Afrika
//
//  Created by Jonathan Sweeney on 10/31/20.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.43776)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode(K.Data.locationsJson)
    var body: some View {
        // MARK: - No1 Basic Map
        // Map(coordinateRegion: $region)
        
        // MARK: - No2 Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // (A) PIN: OLD STYLE (static)
//            MapPin(coordinate: item.location, tint: .accentColor)
            // (B) MARKERS: NEW STYLE (STATIC)
//            MapMarker(coordinate: item.location, tint: .accentColor)
            // (C) CUSTOM BASIC ANNOTATION (interactive)
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }//: ANNOTATION
        })

    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
