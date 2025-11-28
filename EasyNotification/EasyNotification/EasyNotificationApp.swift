//
//  EasyNotificationApp.swift
//  EasyNotification
//
//  Created by Jorge Mayta on 27/11/25.
//

import SwiftUI

@main
struct EasyNotificationApp: App {
    private let notificationManager = NotificationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(notificationManager)
        }
    }
}
