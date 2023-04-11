//
//  Folder.swift
//
//  Created by Amber Wong (student LM) on 2/24/23.
//

import Foundation

class Folder : ObservableObject, Identifiable {
    @Published var folders : [Folder]
    @Published var files : [File]
    @Published var name : String
    let id = UUID()
    
    init(_ name : String = "/", files : [File] = [], folders : [Folder] = []) {
        self.folders = folders
        self.name = name
        self.files = files
    }
}
