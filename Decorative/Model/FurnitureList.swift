//
//  FurnitureList.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/31/23.
//

import Foundation

class FurnitureList : ObservableObject {
    @Published var list : [Furniture]
    
    func contains(_ furniture : Furniture) -> Bool {
        var con = false
        for i in list {
            if furniture == i {
                con = true
            }
        }
        return con
    }
    
    func firstOf(_ furniture : Furniture) -> Int {
        for i in 0..<list.count {
            if list[i] == furniture {
                return i
            }
        }
        return -1
    }
    
    init(_ list : [Furniture] = []) {
        self.list = list
    }
}
