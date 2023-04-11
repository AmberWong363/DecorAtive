//
//  HomeView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var baseFolder: File = File("p1", parent: nil, files: [File(), File()])
    let num = 2
    var body: some View {
        
        VStack{
             
            
            FolderListView()
            
        }
    }
    
    
}



