//
//  OpenInAppApp.swift
//  OpenInApp
//
//  Created by Naveen Katari  on 30/04/24.
//

import SwiftUI

@main
struct OpenInAppApp: App {
    
    init() {
        configureNavigationBar()
    }
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
    }
}

private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
}
