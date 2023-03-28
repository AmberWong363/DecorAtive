//
//  HomeView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var baseFolder: Folder = Folder("p1", parent: nil, files: [Folder(), File(), File()])
    var body: some View {
     
        FolderListView(folder: Binding.constant(baseFolder))
        
        
        }
        
        
    }



