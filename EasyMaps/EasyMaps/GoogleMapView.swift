//
//  GoogleMapView.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 20/11/25.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
   
    let latitude: CLLocationDegrees = -12.1253112953062
    let longitude: CLLocationDegrees = -77.02479341728456
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 17)
        
        let options = GMSMapViewOptions()
        options.camera = camera
        
        let mapView = GMSMapView(options: options)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = "ISIL"
        marker.snippet = "Campus Miraflores"
        marker.map = mapView
        
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
    }
    
}

#Preview {
    GoogleMapView()
        .ignoresSafeArea()
}


