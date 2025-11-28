//
//  ContentView.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 20/11/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        Map {
            Marker("ISIL", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194) )
                
        }
    }
}

#Preview {
    ContentView()
}
