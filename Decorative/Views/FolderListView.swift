//
//  FolderListView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI

struct FolderListView: View {
    
    @Binding var folder: Folder
    
//    @StateObject var folder: Folder = Folder("p1", parent: nil, files: [Folder(), File(), File()])
    
    //    var currentFolder: Folder {
    //        get { return folder }
    //        set { folder = newValue }
    //    }
    
    var body: some View {
        
        
        VStack {
            ZStack{
                Rectangle()
                    .frame(width: .infinity, height: 60, alignment: .top)
                    .ignoresSafeArea()
                    .foregroundColor(Color.gray)
                
                if folder.parent != nil {
                    Button {
                        
                        folder.name = folder.parent!.name
                        folder.files = folder.parent!.files
                        
                        if folder.parent!.parent != nil {
                            folder.parent = folder.parent!.parent
                        }
                    } label: {
                        Text("<- Back")
                    }
                }
            }
            
            ScrollView {
                ForEach(folder.files.indices, id: \.self) { index in
                    if folder.files[index] is Folder {
                        FolderView(folder: $folder.files[index])
                    }else {
                        FileView(file: $folder.files[index])
                    }
                }
                //                    if folder.files[index].isKindOfClass(Folder) {
                //                        FolderView(file: $folder.files[index])
                //                    } else {
                //                        FileView(file: $folder.files[index])
                //                    }
            }
        }
        
        
        
        
        
        
        
        //        HStack(alignment: .top){
        //            Image(systemName: "folder")
        //                .resizable()
        //                .aspectRatio(contentMode: .fill)
        //                .frame(width: 50, height: 50)
        //                .clipShape(Rectangle())
        //
        //
        //            Text(folder.name)
        //                .padding([.trailing, .leading])
        //            Spacer()
        //
        //        }.padding()
        //            .background(Color.gray.opacity(0.1))
        //            .cornerRadius(8)
    }
}

