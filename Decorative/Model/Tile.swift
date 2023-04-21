//
//  Tile.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/2/23.
//

import Foundation
import SwiftUI

class Tile : ObservableObject, Identifiable {
    @Published var restricted : Bool
    @Published var selected : Bool
    @Published var createSelect : Bool
    @Published var inner : [[Tile]]?
    @Published var value : Double
    @Published var wallType : [wallType]
    let id = UUID()
    
    static func ==(rhs : Tile, lhs : Tile) -> Bool {
        return rhs.value == lhs.value
    }
    
    init(restricted : Bool = false,
         value : Double = 3, wallType : [wallType] = [.none, .none, .none, .none], selected : Bool = false, createSelect : Bool = false, inner : [[Tile]]? =
         [
             [
                 Tile(value: 1, inner: nil),
                 Tile(value: 1, inner: nil),
                 Tile(value: 1, inner: nil)
             ],
             [
                 Tile(value: 1, inner: nil),
                 Tile(value: 1, inner: nil),
                 Tile(value: 1, inner: nil)
             ],
             [
                 Tile(value: 1, inner: nil),
                 Tile(value: 1, inner: nil),
                 Tile(value: 1, inner: nil)]]
    ) {
        self.restricted = restricted
        self.value = value
        self.selected = selected
        self.createSelect = createSelect
        self.inner = inner
        self.wallType = wallType
    }
}
