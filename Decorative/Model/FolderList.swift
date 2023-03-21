//
//  FolderList.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/8/23.
//

import Foundation

class FolderList: ObservableObject {
    @Published var folders: [Folder]
 
    
    init(folders : [Folder] = [Folder()]){
        self.folders = folders
    }
}
