//
//  Root.swift
//  Decorative
import Foundation
class Root : ObservableObject {
    @Published var rootFolder : Folder
    @Published var folder : Folder
    @Published var previous : [Folder]
    @Published var savedID : UUID = UUID()
    
    init(_ folder : Folder = Folder("root", files: [], folders: [Folder("2nd Floor", files: [], folders: [Folder(), Folder(), Folder()]), Folder(), Folder()]), rootFolder : Folder = Folder(), previous : [Folder] = [] ) {
        self.folder = folder
        self.rootFolder = rootFolder
        self.previous = previous
    }
}
