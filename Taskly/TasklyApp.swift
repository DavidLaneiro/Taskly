//
//  TasklyApp.swift
//  Taskly
//
//  Created by David  Lourenço on 08/06/2024.
//

import SwiftUI

@main
struct TasklyApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            TasklyHomePage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
