//
//  RoomExpansionView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 4/7/23.
//

import SwiftUI

struct RoomExpansionView: View {
    @State var zoom : Int = 20
    @State var roomState : roomState = .edit
    @EnvironmentObject var viewState : ViewState
    @EnvironmentObject var currentRoom : Room
    @EnvironmentObject var currentFile : File
    @EnvironmentObject var root : Root
    @EnvironmentObject var map : Map
    @EnvironmentObject var user : User
    @State var currentFurniture : Furniture? = nil
    @State var currentTile : Tile = Tile(value: -1)
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Spacer()
                    
                    Text("Home")
                        .padding()
                        .background(Color.accent)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .onAppear {
                            currentFile.room.accessed = true
                        }
                        .onTapGesture {
//                            currentFile.map = map
//                            currentFile.room = currentRoom
                            
                            for i in 0..<root.folder.files.count {
                                if root.folder.files[i].id == root.savedID {
                                    print("Saved!")
                                    root.folder.files[i].room = currentFile.room
                                    root.folder.files[i].name = currentFile.name
                                    root.folder.files[i].map = currentFile.map
                                }
                            }
                            
                            map.room = []
                            map.name = ""
                            map.array = []
                            user.selectedSpecialTile = nil
                            user.selectedTile = nil
                            currentRoom.room = []
                            currentRoom.name = ""
                            currentRoom.furnitureList = FurnitureList()
                            
                            currentFile.room = File().room
                            currentFile.name = File().name
                            currentFile.map = File().map
                            
                            viewState.state = .menu
                        }
                        .padding()
                }
                FurnitureBarView(furnitureList: $currentRoom.furnitureList, zoom: $zoom)
                
                ZStack {
                    RoomView(zoom: $zoom, roomState: $roomState, currentFurniture: $currentFurniture, currentTile: $currentTile)
                        .padding(.horizontal)
                    
                    HStack {
                        if !(currentTile == Tile(value: -1)) {
                            RoomTileEditView(currentTile: $currentTile)
                        } else if currentFurniture != nil {
                            FurnitureEditView(furniture: $currentFurniture, zoom: $zoom)
                        } else {
                            VStack {
                                Rectangle()
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .frame(width: 10)
                            }
                            
                        }
                        Spacer()
                    }
                }
                
                HStack {
                    // Button for Door modifying
                    Button {
                        roomState = .doors
                    } label: {
                        Text("Door Mode")
                            .padding()
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                    }
                    // Button for window modifying
                    Button {
                        roomState = .windows
                    } label: {
                        Text("Window Mode")
                            .padding()
                            .background(Color.red.opacity(0.8))
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                    }
                    // Button for editing
                    Button {
                        roomState = .edit
                    } label: {
                        Text("Edit Mode")
                            .padding()
                            .background(Color.accent.opacity(0.8))
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                    }

                }
                
                Slider(value: .convert(from: $zoom), in: 10...100, step: 1)
                    .padding()
            }
        }
    }
}
