//
//  TilliesApp.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/18/22.
//

import SwiftUI

@main
struct TilliesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NFTCardView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
