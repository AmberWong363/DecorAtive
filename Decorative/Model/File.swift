//
//  File.swift
//
//  Created by Amber Wong (student LM) on 2/24/23.
//

import Foundation

class File : ObservableObject, Identifiable {
    @Published var name : String
    @Published var room : Room
    @Published var map : Map
    let id = UUID()
    
    init(_ name : String = "New File", room : Room = Room(), map : Map = Map()) {
        self.name = name
        self.room = room
        self.map = map
    }
}
