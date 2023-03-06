//
//  Tile.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/2/23.
//

import Foundation

class Tile : ObservableObject, Identifiable {
    @Published var restricted : Bool
    @Published var inner : [[Tile]]?
    @Published var value : Double
    @Published var thickness : Int
    let id = UUID()
    
    init(restricted : Bool = false, inner : [[Tile]]? =
    [[Tile(inner:
            [[Tile(inner: nil, value: 0.5), Tile(inner: nil, value: 0.5)],
             [Tile(inner: nil, value: 0.5),  Tile(inner: nil, value: 0.5)]],
           value: 1),
      Tile(inner:
              [[Tile(inner: nil, value: 0.5), Tile(inner: nil, value: 0.5)],
               [Tile(inner: nil, value: 0.5),  Tile(inner: nil, value: 0.5)]],
             value: 1),
      Tile(inner:
              [[Tile(inner: nil, value: 0.5), Tile(inner: nil, value: 0.5)],
               [Tile(inner: nil, value: 0.5),  Tile(inner: nil, value: 0.5)]],
             value: 1)],
     [Tile(inner:
                [[Tile(inner: nil, value: 0.5), Tile(inner: nil, value: 0.5)],
                 [Tile(inner: nil, value: 0.5),  Tile(inner: nil, value: 0.5)]],
               value: 1),
          Tile(inner:
                  [[Tile(inner: nil, value: 0.5), Tile(inner: nil, value: 0.5)],
                   [Tile(inner: nil, value: 0.5),  Tile(inner: nil, value: 0.5)]],
                 value: 1),
          Tile(inner:
                  [[Tile(inner: nil, value: 0.5), Tile(inner: nil, value: 0.5)],
                   [Tile(inner: nil, value: 0.5),  Tile(inner: nil, value: 0.5)]],
                 value: 1)],
     [Tile(inner:
             [[Tile(inner: nil, value: 0.5), Tile(inner: nil, value: 0.5)],
              [Tile(inner: nil, value: 0.5),  Tile(inner: nil, value: 0.5)]],
            value: 1),
       Tile(inner:
               [[Tile(inner: nil, value: 0.5), Tile(inner: nil, value: 0.5)],
                [Tile(inner: nil, value: 0.5),  Tile(inner: nil, value: 0.5)]],
              value: 1),
       Tile(inner:
               [[Tile(inner: nil, value: 0.5), Tile(inner: nil, value: 0.5)],
                [Tile(inner: nil, value: 0.5),  Tile(inner: nil, value: 0.5)]],
              value: 1)]],
         value : Double = 3, thickness : Int = 5
    ) {
        self.restricted = restricted
        self.inner = inner
        self.value = value
        self.thickness = thickness
    }
}
