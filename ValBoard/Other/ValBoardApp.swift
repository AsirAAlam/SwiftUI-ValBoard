//
//  ValBoardApp.swift
//  ValBoard
//
//  Created by Asir Alam on 8/24/24.
//

import SwiftUI
import FirebaseCore

@main
struct ValBoardApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}
