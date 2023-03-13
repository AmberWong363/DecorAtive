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
    
    var body: some Scene {
        WindowGroup {
            MapExpansionView()
                .environmentObject(map)
                .environmentObject(user)
        }
    }
}
