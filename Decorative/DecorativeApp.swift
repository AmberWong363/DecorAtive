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

//    @StateObject var folderList : [File] = [Folder(), Folder(), File()]
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var userInfo : UserInfo = UserInfo()
//    @StateObject var folder: Folder = Folder("p1", parent: nil, files: [Folder(), File(), File()])
    @StateObject var root: Root = Root()

    
    var body: some Scene {
        WindowGroup {
            
            MenuView().environmentObject(root).environmentObject(UserInfo())
            
//            MenuView()
//                .environmentObject(FolderList())
//                .environmentObject(userInfo)
        }
    }
}
