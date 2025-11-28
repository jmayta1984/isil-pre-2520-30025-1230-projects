//
//  ContentView.swift
//  EasyNotification
//
//  Created by Jorge Mayta on 27/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notificationManager: NotificationManager
    
    var body: some View {
        VStack {
            Button {
                notificationManager.scheduleNotification()
            } label: {
                Text("Schedule notification")
            }
            
            Button {
                notificationManager.calendarNotification()
            } label: {
                Text("Calendar notification")
            }

        }
        .onAppear {
            notificationManager.requestNotificationPermissions()
        }
    }
}
