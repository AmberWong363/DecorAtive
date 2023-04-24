//
//  Folder.swift
//
//  Created by Amber Wong (student LM) on 2/24/23.
//

import Foundation

class Folder : NSObject, ObservableObject, Identifiable, NSCoding {
    @Published var folders : [Folder]
    @Published var files : [File]
    @Published var name : String
    let id = UUID()
    
    init(_ name : String = "/", files : [File] = [], folders : [Folder] = []) {
        self.folders = folders
        self.name = name
        self.files = files
    }
    func encode(with coder: NSCoder) {
            coder.encode(name, forKey: "name")
            coder.encode(files, forKey: "files")
            coder.encode(folders, forKey: "folders")
        }
    
    required init?(coder: NSCoder) {
            guard let name = coder.decodeObject(forKey: "name") as? String,
                  let files = coder.decodeObject(forKey: "files") as? [File],
                let folders = coder.decodeObject(forKey: "folders") as? [Folder] else {
                return nil
            }
        self.name = name
        self.files = files
        self.folders = folders
    }
}
