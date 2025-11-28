//
//  GoogleMapHelper.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 20/11/25.
//

import GoogleMaps

class GoogleMapHelper {
    
    static let shared = GoogleMapHelper()
    
    private init() {
        GMSServices.provideAPIKey("YOUR API KEY HERE")
    }
    
   
}
