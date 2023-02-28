//
//  File.swift
//
//  Created by Amber Wong (student LM) on 2/24/23.
//

import Foundation

class File : ObservableObject, Identifiable {
    @Published var name : String
    @Published var parent : Folder?
    let id = UUID()
    
    init(_ name : String = "", parent : Folder? = nil) {
        self.name = name
        self.parent = parent
    }
}
