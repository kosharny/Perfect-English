//
//  Ladichka_Perfect_EnglishApp.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 12.09.2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct Ladichka_Perfect_EnglishApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .preferredColorScheme(.light)
        }
    }
}
