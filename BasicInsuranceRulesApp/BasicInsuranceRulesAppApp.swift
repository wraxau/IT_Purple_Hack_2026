//
//  BasicInsuranceRulesAppApp.swift
//  BasicInsuranceRulesApp
//
//  Created by нина on 04.04.2026.
//

import SwiftUI
import CoreData

@main
struct BasicInsuranceRulesAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
