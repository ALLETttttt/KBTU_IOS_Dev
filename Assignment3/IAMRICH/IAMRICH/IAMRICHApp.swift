//
//  IAMRICHApp.swift
//  IAMRICH
//
//  Created by Бакдаулет on 27.09.2024.
//

import SwiftUI

@main
struct IAMRICHApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
