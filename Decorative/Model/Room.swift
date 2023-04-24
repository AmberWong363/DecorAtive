//
//  Room.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/30/23.
//

import Foundation

class Room : ObservableObject {
    @Published var room : [[Tile]]
    @Published var furnitureList : FurnitureList
    @Published var name : String
    @Published var accessed : Bool
    
    init(_ room : [[Tile]] = [], furnitureList : FurnitureList = FurnitureList(), name : String = "Untitled Room", accessed : Bool = false) {
        self.room = room
        self.furnitureList = furnitureList
        self.name = name
        self.accessed = accessed
    }
    
    func getWallBorders() {
        for i in 0..<room.count {
            for j in 0..<room[i].count {
                // Top
                if i == 0 && room[i][j].selected && room[i][j].wallType[3] == .none {
                    room[i][j].wallType[3] = .wall
                } else if i != 0 && room[i][j].selected && !room[i-1][j].selected && room[i][j].wallType[3] == .none {
                    room[i][j].wallType[3] = .wall
                }
                
                // Bottom
                if i == room.count - 1 && room[i][j].selected && room[i][j].wallType[2] == .none {
                    room[i][j].wallType[2] = .wall
                } else if i != room.count - 1 && room[i][j].selected && !room[i+1][j].selected && room[i][j].wallType[2] == .none {
                    room[i][j].wallType[2] = .wall
                }
                // Trailing
                if j == 0 && room[i][j].selected && room[i][j].wallType[0] == .none {
                    room[i][j].wallType[0] = .wall
                } else if j != 0 && room[i][j].selected && !room[i][j-1].selected && room[i][j].wallType[0] == .none {
                    room[i][j].wallType[0] = .wall
                }
                // Leading
                if j == room[i].count - 1 && room[i][j].selected && room[i][j].wallType[1] == .none {
                    room[i][j].wallType[1] = .wall
                } else if j != room[i].count - 1 && room[i][j].selected && !room[i][j+1].selected && room[i][j].wallType[1] == .none {
                    room[i][j].wallType[1] = .wall
                }
            }
        }
    }
}
