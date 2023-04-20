//
//  DecorativeApp.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 2/27/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct DecorativeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var userInfo : UserInfo = UserInfo()
    @StateObject var map : Map = Map()
    @StateObject var user : User = User()
    @StateObject var viewState : ViewState = ViewState()
    @StateObject var currentRoom : Room = Room()
    @StateObject var root : Root = Root()
    @StateObject var addedFurnitureList : FurnitureList = FurnitureList([])
    var body: some Scene {
        WindowGroup {
            MotherView()
                .environmentObject(map)
                .environmentObject(user)
                .environmentObject(viewState)
                .environmentObject(currentRoom)
                .environmentObject(root)
                .environmentObject(addedFurnitureList)
                .environmentObject(userInfo)
        }
    }
}
