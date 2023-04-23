//
//  FolderListView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/8/23.
//

import SwiftUI

struct FolderView: View {
    @State var rename: Bool = false
    @Binding var folder: Folder
    @EnvironmentObject var root : Root
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(height: 60, alignment: .center)
                .foregroundColor(Color.accentColor)
                .cornerRadius(8)
            
            HStack(){
                // folder Icon - navigate to folder
                Image("folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50.0, height: 50.0)
                    .padding()
                    .onTapGesture {
                        root.previous.append(root.folder)
                        root.folder = folder
                    }
                // Folder Name
                if rename == false {
                    Text("\(folder.name)")
                        .font(Font.title2)
                        .padding()
                } else {
                    TextField("Type something here...", text: $folder.name)
                        .padding(.vertical)
                        .zIndex(5)
                        .onSubmit {
                            rename = false
                        }
                        
                }
                    
                Spacer()
                
                
                
                // Drop Down Actions Menu
                Menu {
                     
                    Button {
                        rename.toggle()
                    } label: {
                        Text("Rename")
                    }
                    
                    Button {
                        MoveTo()
                    } label: {
                        Text("Move To ->")
                    }
                    Button {
                        Share()
                    } label: {
                        Text("Share")
                    }
                    Button {
                        MakeACopy()
                    } label: {
                        Text("Make a Copy")
                    }
                    

                } label: {
                    Image("options")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(width: 60, height: 60, alignment: .trailing)
                }
                
                
            }
        }
    }
    
    
    func MoveTo() {
        //
    }
    func Share() {
        //
    }
    func MakeACopy() {
        root.folder.folders.append(Folder("Copy Of \(folder.name)", files: folder.files, folders: folder.folders))
        root.folder = root.folder
    }
}

