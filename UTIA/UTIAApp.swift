//
//  testApp.swift
//  test
//
//  Created by Hari krishna on 24/11/21.
//

import SwiftUI
import CoreData

@main
struct UTIAApp: App {
    var body: some Scene {
        let persistenceController = PersistenceController.shared
        WindowGroup {
            ContentView().environmentObject(ListManager())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
        }
    }
}
