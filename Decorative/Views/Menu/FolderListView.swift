//
//  FolderListView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI
struct FolderListView: View {
    @EnvironmentObject var root : Root
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack{
                
                
                // Back button for menu navigation
                HStack{
                    
                    if !root.previous.isEmpty {
                        Button {
                            if !root.previous.isEmpty {
                                root.folder = root.previous.last!
                                root.previous.removeLast()
                            }
                        } label: {
                            ZStack{
                                
                                Rectangle()
                                    .frame(width: 65, height: 32, alignment: .leading)
                                    .cornerRadius(6)
                                    .foregroundColor(Color.gray)
                                    .ignoresSafeArea()
                                
                                
                                
                                Text(" <-Back")
                                    .foregroundColor(Color.black)
                                    .cornerRadius(5)
                            }
                            
                        }
                    }
                    
                    Spacer()
                }
                
               
                
            }
            
            // Display list of folders and files
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(root.folder.folders.indices, id: \.self) { index in
                        FolderView(folder: $root.folder.folders[index])
                    }
                    ForEach(root.folder.files.indices, id: \.self) { index in
                        FileView(file: $root.folder.files[index])
                    }
                }
            }
            
            Spacer()
        }
    }
}

