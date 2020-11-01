//
//  InsertMapView.swift
//  Afrika
//
//  Created by Jonathan Sweeney on 11/1/20.
//

import MapKit
import SwiftUI

struct InsertMapView: View {
    @State private var Region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.6, longitude: 14.43776), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    var body: some View {
        Map(coordinateRegion: $Region)
            .overlay(NavigationLink(destination: MapView()) {
                HStack {
                    Image(systemName: "mappin.circle")
                        .foregroundColor(Color.white)
                        .imageScale(.large)
                    Text("Locations")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                }//: HSTACK
                .padding(.vertical, 10)
                .padding(.horizontal, 14)
                .background(
                    Color.black
                        .opacity(0.4)
                        .cornerRadius(8)
                )
            }//: NAV
            .padding(12),
            alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsertMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsertMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
