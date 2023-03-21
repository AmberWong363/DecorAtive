//
//  Folder.swift
//
//  Created by Amber Wong (student LM) on 2/24/23.
//

import Foundation

class Folder : File {
    @Published var files : [File]
    
    init(_ name : String = "/", parent: Folder? = nil, files : [File] = [File()]) {
        self.files = files
        super.init(name, parent: parent)
    }
}
