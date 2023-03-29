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
    @Published var room : [[Tile]]
    var extendedArray : [[Tile]] {
        var arr : [[Tile]] = []
        for i in 0..<array.count {
            for _ in 0..<3 {
                arr.append([])
            }
            
            for j in 0..<array[i].count {
                for k in array[i][j].inner! {
                    for l in 0..<k.count {
                        arr[i * array[i][j].inner!.count + 2-l].append(k[2-l])
                    }
                }
            }
        }
        return arr
    }
    
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
         name : String = "Untitled Map", room : [[Tile]] = []) {
        self.array = array
        self.name = name
        self.room = room
    }
    
    func generateRoomArray() -> [[Tile]]{
        var arr : [[Tile]] = []
        
        for i in extendedArray {
            for j in 0..<i.count {
                if i[j].selected {
                    arr.append(i)
                    break
                }
            }
        }
        
        var smallGap = -1
        for i in arr {
            for j in 0..<i.count {
                if i[j].selected && smallGap == -1{
                    smallGap = j
                    break
                } else if i[j].selected && smallGap > -1 {
                    if j < smallGap {
                        smallGap = j
                    }
                    break
                }
            }
        }
        
        for i in 0..<arr.count {
            for _ in 0..<smallGap {
                arr[i].remove(at: 0)
            }
        }
        
        var largeGap = -1
        for i in arr {
            for j in 0..<i.count {
                if i[i.count - j - 1].selected && largeGap == -1{
                    largeGap = j
                    break
                } else if i[i.count - j - 1].selected && largeGap > -1 {
                    if j < largeGap {
                        largeGap = j
                    }
                    break
                }
            }
        }
        for i in 0..<arr.count {
            arr[i].removeLast(largeGap)
        }
        
        return arr
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
                        
                        if array[i][j].inner != nil {
                            for k in array[i][j].inner! {
                                for l in k {
                                    l.selected = true
                                }
                            }
                        }
                    }
                } else {
                    for j in tile1Indices.1...tile2Indices.1 {
                        if array[i][j].selected == false {
                            notSelected = true
                        }
                        selection = 2
                        array[i][j].selected = true
                        
                        if array[i][j].inner != nil {
                            for k in array[i][j].inner! {
                                for l in k {
                                    l.selected = true
                                }
                            }
                        }
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
                        
                        if array[i][j].inner != nil {
                            for k in array[i][j].inner! {
                                for l in k {
                                    l.selected = true
                                }
                            }
                        }
                    }
                } else {
                    for j in tile1Indices.1...tile2Indices.1 {
                        if array[i][j].selected == false {
                            notSelected = true
                        }
                        selection = 4
                        array[i][j].selected = true
                        
                        if array[i][j].inner != nil {
                            for k in array[i][j].inner! {
                                for l in k {
                                    l.selected = true
                                }
                            }
                        }
                    }
                }
            }
        }
        
        //        Debugging Tool
        //        for i in array {
        //            for j in i {
        //                if j.selected {
        //                    print("X ", terminator: "")
        //                } else {
        //                    print("- ", terminator: "")
        //                }
        //            }
        //            print()
        //        }
        //        print()
        //
        //        for i in array {
        //            for j in i {
        //                for k in j.inner! {
        //                    for l in k {
        //                        if l.selected {
        //                            print("X", terminator: "")
        //                        } else {
        //                            print("-", terminator: "")
        //                        }
        //                    }
        //                    print()
        //                }
        //            }
        //            print()
        //        }
        //        print()
        
        
        // OH GOD
        if !notSelected {
            switch (selection) {
            case 1:
                for i in tile2Indices.0...tile1Indices.0 {
                    for j in tile2Indices.1...tile1Indices.1 {
                        array[i][j].selected = false
                        
                        if array[i][j].inner != nil {
                            for k in array[i][j].inner! {
                                for l in k {
                                    l.selected = false
                                }
                            }
                        }
                    }
                }
            case 2:
                for i in tile2Indices.0...tile1Indices.0 {
                    for j in tile1Indices.1...tile2Indices.1 {
                        array[i][j].selected = false
                        
                        if array[i][j].inner != nil {
                            for k in array[i][j].inner! {
                                for l in k {
                                    l.selected = false
                                }
                            }
                        }
                    }
                }
            case 3:
                for i in tile1Indices.0...tile2Indices.0 {
                    for j in tile2Indices.1...tile1Indices.1 {
                        array[i][j].selected = false
                        
                        if array[i][j].inner != nil {
                            for k in array[i][j].inner! {
                                for l in k {
                                    l.selected = false
                                }
                            }
                        }
                    }
                }
            case 4:
                for i in tile1Indices.0...tile2Indices.0 {
                    for j in tile1Indices.1...tile2Indices.1 {
                        array[i][j].selected = false
                        
                        if array[i][j].inner != nil {
                            for k in array[i][j].inner! {
                                for l in k {
                                    l.selected = false
                                }
                            }
                        }
                    }
                }
            default:
                return
            }
        }
    }
    
    func generateExtendedRectangleArea(tile1Indices : (Int, Int), tile2Indices : (Int, Int)) {
        var selection : Int = 0
        var notSelected : Bool = false
        // Yatta!
        if tile1Indices.0 >= tile2Indices.0 {
            for i in tile2Indices.0...tile1Indices.0 {
                if tile1Indices.1 >= tile2Indices.1 {
                    for j in tile2Indices.1...tile1Indices.1 {
                        if extendedArray[i][j].selected == false {
                            notSelected = true
                        }
                        selection = 1
                        extendedArray[i][j].selected = true
                    }
                } else {
                    for j in tile1Indices.1...tile2Indices.1 {
                        if extendedArray[i][j].selected == false {
                            notSelected = true
                        }
                        selection = 2
                        extendedArray[i][j].selected = true
                    }
                }
            }
        } else {
            for i in tile1Indices.0...tile2Indices.0 {
                if tile1Indices.1 >= tile2Indices.1 {
                    for j in tile2Indices.1...tile1Indices.1 {
                        if extendedArray[i][j].selected == false {
                            notSelected = true
                        }
                        selection = 3
                        extendedArray[i][j].selected = true
                    }
                } else {
                    for j in tile1Indices.1...tile2Indices.1 {
                        if extendedArray[i][j].selected == false {
                            notSelected = true
                        }
                        selection = 4
                        extendedArray[i][j].selected = true
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
                        extendedArray[i][j].selected = false
                    }
                }
            case 2:
                for i in tile2Indices.0...tile1Indices.0 {
                    for j in tile1Indices.1...tile2Indices.1 {
                        extendedArray[i][j].selected = false
                    }
                }
            case 3:
                for i in tile1Indices.0...tile2Indices.0 {
                    for j in tile2Indices.1...tile1Indices.1 {
                        extendedArray[i][j].selected = false
                    }
                }
            case 4:
                for i in tile1Indices.0...tile2Indices.0 {
                    for j in tile1Indices.1...tile2Indices.1 {
                        extendedArray[i][j].selected = false
                    }
                }
            default:
                return
            }
        }
        
        for i in array {
            for j in i {
                for k in j.inner! {
                    for l in k {
                        if l.selected {
                            j.selected = true
                        }
                    }
                }
            }
        }
    }
}
