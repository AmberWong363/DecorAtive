//
//  User.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/9/23.
//

import Foundation

class User : ObservableObject {
    @Published var selectedTile : (Int, Int)?
    @Published var selectedSpecialTile : (Int, Int, Int, Int)?
    
    init(selectedTile : (Int, Int)? = nil, selectedSpecialTile : (Int, Int, Int, Int)? = nil) {
        self.selectedTile = selectedTile
        self.selectedSpecialTile = selectedSpecialTile
    }
}
