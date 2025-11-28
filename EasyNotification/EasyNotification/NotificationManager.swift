//
//  NotificationManager.swift
//  EasyNotification
//
//  Created by Jorge Mayta on 27/11/25.
//

import Combine
import UserNotifications

class NotificationManager: NSObject ,ObservableObject, UNUserNotificationCenterDelegate {
    
    override init() {
        super.init()
        configure()
    }
    
    func configure() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
    }
    
    func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Permission: \(granted)")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Schedule notification"
        content.body = "This is a scheduled notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Schedule notification")
            }
        }
    }
    
    func calendarNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Calendar notification"
        content.body = "This is a calendar notification"
        content.sound = .defaultRingtone
        
        var date = DateComponents()
        date.hour = 20
        date.minute = 14
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Calendar notification")
            }
        }
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }
}
