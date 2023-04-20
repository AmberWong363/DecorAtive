//
//  DecorativeApp.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 2/27/23.
//

import SwiftUI

@main
struct DecorativeApp: App {
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
        }
    }
}
