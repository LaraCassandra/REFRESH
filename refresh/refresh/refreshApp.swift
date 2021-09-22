//
//  refreshApp.swift
//  refresh
//
//  Created by Lara Cook on 2021/09/22.
//

import SwiftUI
import Firebase

@main
struct refreshApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("Firebase... ")
        FirebaseApp.configure()
        
        return true
    }
}
