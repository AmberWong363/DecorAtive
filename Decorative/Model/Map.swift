//
//  Map.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 2/28/23.
//

import Foundation

class Map : ObservableObject {
    @Published var array : [[Int]]
    @Published var name : String
    @Published var metric : Bool
    
    init(_ array : [[Int]] = [[]], name : String = "New Map", metric : Bool = false) {
        self.array = array
        self.name = name
        self.metric = metric
    }
}
