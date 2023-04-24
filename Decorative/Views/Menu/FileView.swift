//
//  FileView.swift
//  Decorative
//
//  Created by Reuben Gottesman (student LM) on 3/23/23.
//

import SwiftUI

struct FileView: View {
    @State var rename: Bool = false
    @Binding var file: File
    @EnvironmentObject var root : Root
    @EnvironmentObject var viewState : ViewState
    @EnvironmentObject var map : Map
    @EnvironmentObject var currentRoom : Room
    @EnvironmentObject var currentFile : File

    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(height: 60, alignment: .center)
                .foregroundColor(Color.accentColor)
                .cornerRadius(8)
            
            
            // File Icon - navigate to file
            HStack {
                Image("file")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50.0, height: 50.0)
                    .padding()
                    .onTapGesture {
                        currentFile.room = file.room
                        currentFile.name = file.name
                        currentFile.map = file.map
                        
                        root.savedID = file.id
                        
                        map.array = file.map.array
                        currentRoom.room = file.room.room
                        currentRoom.furnitureList = file.room.furnitureList
                        currentRoom.name = file.room.name
                        
                        if !file.room.accessed {
                            viewState.state = .map
                        } else {
                            viewState.state = .room
                        }
                        
                    }
                
                // File Name
                if rename == false {
                    Text("\(file.name)")
                        .font(Font.title2)
                        .padding()
                } else {
                    TextField("Type something here...", text: $file.name)
                        .padding(.vertical)
                        .zIndex(5)
                        .onSubmit {
                            file.room.name = file.name
                            file.map.name = file.name
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
                        let activityViewController = share(object: root.folder)
                        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
                    } label: {
                        Text("Share")
                    }
                    Button {
                        root.folder.files.append(File("\(file.name) (1)", room: file.room, map: file.map))
                        root.folder = root.folder
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
    func share(object: Folder) -> UIActivityViewController {
        let shareText = "Check out this object: \(object.name)"
        let shareImage = UIImage(named: "objectImage")
        let activityViewController = UIActivityViewController(activityItems: [shareText, shareImage], applicationActivities: nil)
        return activityViewController
    }
    func MakeACopy() {
        //
    }
    
}

