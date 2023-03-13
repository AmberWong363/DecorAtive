//
//  Map.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 2/28/23.
//

import Foundation

class Map : ObservableObject {
    @Published var array : [[Tile]]
    @Published var name : String
    @Published var metric : Bool
    
    init(_ array : [[Tile]] = [
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()],
        [Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile(), Tile()]],
         name : String = "New Map", metric : Bool = false) {
        self.array = array
        self.name = name
        self.metric = metric
    }
    
    func generateRectangleArea(tile1Indices : (Int, Int), tile2Indices : (Int, Int)) {
        var selection : Int = 0
        var notSelected : Bool = false
        // Yatta!
        if tile1Indices.0 >= tile2Indices.0 {
            for i in tile2Indices.0...tile1Indices.0 {
                if tile1Indices.1 >= tile2Indices.1 {
                    for j in tile2Indices.1...tile1Indices.1 {
                        if array[i][j].selected == false {
                            notSelected = true
                        }
                        selection = 1
                        array[i][j].selected = true
                    }
                } else {
                    for j in tile1Indices.1...tile2Indices.1 {
                        if array[i][j].selected == false {
                            notSelected = true
                        }
                        selection = 2
                        array[i][j].selected = true
                    }
                }
            }
        } else {
            for i in tile1Indices.0...tile2Indices.0 {
                if tile1Indices.1 >= tile2Indices.1 {
                    for j in tile2Indices.1...tile1Indices.1 {
                        if array[i][j].selected == false {
                            notSelected = true
                        }
                        selection = 3
                        array[i][j].selected = true
                    }
                } else {
                    for j in tile1Indices.1...tile2Indices.1 {
                        if array[i][j].selected == false {
                            notSelected = true
                        }
                        selection = 4
                        array[i][j].selected = true
                    }
                }
            }
        }
        // OH GOD
        if !notSelected {
            switch (selection) {
            case 1:
                for i in tile2Indices.0...tile1Indices.0 {
                    for j in tile2Indices.1...tile1Indices.1 {
                        array[i][j].selected = false
                    }
                }
            case 2:
                for i in tile2Indices.0...tile1Indices.0 {
                    for j in tile1Indices.1...tile2Indices.1 {
                        array[i][j].selected = false
                    }
                }
            case 3:
                for i in tile1Indices.0...tile2Indices.0 {
                    for j in tile2Indices.1...tile1Indices.1 {
                        array[i][j].selected = false
                    }
                }
            case 4:
                for i in tile1Indices.0...tile2Indices.0 {
                    for j in tile1Indices.1...tile2Indices.1 {
                        array[i][j].selected = false
                    }
                }
            default:
                return
            }
        }
    }
}
