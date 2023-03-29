//
//  DecorativeApp.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 2/27/23.
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
struct DecorativeApp: App {

    @StateObject var folderList = FolderList()
    @StateObject var userInfo : UserInfo = UserInfo()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
 
    var body: some Scene {
        WindowGroup {
            MenuView().environmentObject(FolderList()).environmentObject(userInfo)
        }
    }
}
