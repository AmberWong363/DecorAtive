//
//  Root.swift
//  Decorative
//
//  Created by Reuben Gottesman (student LM) on 3/31/23.
//

import Foundation
class Root : ObservableObject {
    @Published var rootFolder : Folder
    @Published var folder : Folder
    @Published var previous : [Folder]
    
    init(_ folder : Folder = Folder("root", files: [], folders: [Folder("foot", files: [], folders: [Folder(), Folder(), Folder()]), Folder(), Folder()]), rootFolder : Folder = Folder(), previous : [Folder] = []) {
        self.folder = folder
        self.rootFolder = rootFolder
        self.previous = previous
    }
}
