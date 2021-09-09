//
//  MapView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 9/9/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
 
    private var pointsOfInterest = [
        AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.75773, longitude: -73.985708)),
        AnnotatedItem(name: "Flatiron Building", coordinate: .init(latitude: 40.741112, longitude: -73.989723)),
        AnnotatedItem(name: "Empire State Building", coordinate: .init(latitude: 40.748817, longitude: -73.985428))
        ]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
            MapAnnotation(coordinate: item.coordinate) {
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(Color.purple, lineWidth: 4.0)
                    .frame(width: 30, height: 30)
            }
//            MapMarker(coordinate: item.coordinate, tint: .red)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
