//
//  HaruBudgetWatchApp.swift
//  HaruBudgetWatch WatchKit Extension
//
//  Created by 송시원 on 2022/06/29.
//

import SwiftUI

@main
struct HaruBudgetWatchApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environment(\.managedObjectContext, PersistentController.shared.container.viewContext)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
