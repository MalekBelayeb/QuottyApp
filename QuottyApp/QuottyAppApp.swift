//
//  QuottyAppApp.swift
//  QuottyApp
//
//  Created by ODC on 8/2/2022.
//

import SwiftUI

@main
struct QuottyAppApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
