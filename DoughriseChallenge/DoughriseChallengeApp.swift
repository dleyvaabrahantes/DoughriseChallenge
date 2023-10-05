//
//  DoughriseChallengeApp.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import SwiftUI

@main
struct DoughriseChallengeApp: App {
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.context)
        }.onChange(of: scenePhase) { newValue in
            CoreDataManager.shared.saveContext()
        }
    }
}
