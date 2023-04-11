//
//  File.swift
//
//  Created by Amber Wong (student LM) on 2/24/23.
//

import Foundation

class File : ObservableObject, Identifiable {
    @Published var name : String
    let id = UUID()
    
    init(_ name : String = "") {
        self.name = name
    }
}
