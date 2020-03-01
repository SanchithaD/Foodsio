//
//  Notifications.swift
//  Foodsio
//
//  Created by Radha Paravastu on 2/29/20.
//  Copyright © 2020 Radha Paravastu. All rights reserved.
//


import SwiftUI

struct Notifications: View {
    @State var alert = false
    
    var body: some View {
        
        Button(action: {
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (status, _) in
                
                
                if status{
                    
                    let content = UNMutableNotificationContent()
                    content.title = "Notification"
                    content.body = "Your cookies will expire in 1 week!"
                    
                    // this time interval represents the delay time of notification
                    // ie., the notification will be delivered after the delay.....
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
                    
                    let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                    
                    return
                }
                
                self.alert.toggle()
            }
            
        }) {
            
            Text("Send Notification")
        }.alert(isPresented: $alert) {
            
            return Alert(title: Text("Please Enable Notification Access In Settings Pannel !!!"))
        }
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
