//
//  RoomTileEditView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 4/7/23.
//

import SwiftUI

struct RoomTileEditView: View {
    @Binding var currentTile : Tile
    @State var zoom : Int = 20
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 120)
                .foregroundColor(Color.black.opacity(0.8))
                .cornerRadius(20)
            VStack {
                HStack {
                    // Top
                    VStack {
                        Text("Top Wall")
                            .foregroundColor(Color.white)
                        Picker(selection: $currentTile.wallType[0]) {
                            Text("None").tag(wallType.none)
                            Text("Door").tag(wallType.door)
                            Text("Wall").tag(wallType.wall)
                            Text("Window").tag(wallType.window)
                        } label: {
                            Text("Top Wall")
                        }
                        .onChange(of: currentTile.wallType[0], perform: { _ in
                            zoom += 1
                            zoom -= 1
                        })
                    }
                    // Bottom
                    VStack {
                        Text("Bottom Wall")
                            .foregroundColor(Color.white)
                        Picker(selection: $currentTile.wallType[1]) {
                            Text("None").tag(wallType.none)
                            Text("Door").tag(wallType.door)
                            Text("Wall").tag(wallType.wall)
                            Text("Window").tag(wallType.window)
                        } label: {
                            Text("Bottom Wall")
                        }
                        .onChange(of: currentTile.wallType[1], perform: { _ in
                            zoom += 1
                            zoom -= 1
                        })
                    }
                }
                HStack {
                    // Trailing
                    VStack {
                        Text("Right Wall")
                            .foregroundColor(Color.white)
                        Picker(selection: $currentTile.wallType[2]) {
                            Text("None").tag(wallType.none)
                            Text("Door").tag(wallType.door)
                            Text("Wall").tag(wallType.wall)
                            Text("Window").tag(wallType.window)
                        } label: {
                            Text("Right Wall")
                        }
                        .onChange(of: currentTile.wallType[2], perform: { _ in
                            zoom += 1
                            zoom -= 1
                        })
                    }
                    // Leading
                    VStack {
                        Text("Left Wall")
                            .foregroundColor(Color.white)
                        Picker(selection: $currentTile.wallType[3]) {
                            Text("None").tag(wallType.none)
                            Text("Door").tag(wallType.door)
                            Text("Wall").tag(wallType.wall)
                            Text("Window").tag(wallType.window)
                        } label: {
                            Text("Left Wall")
                        }
                        .onChange(of: currentTile.wallType[3], perform: { _ in
                            zoom += 1
                            zoom -= 1
                        })
                    }
                }
                
                Toggle(isOn: $currentTile.restricted) {
                    Text("Restrict")
                        .foregroundColor(Color.red)
                }
                .onChange(of: currentTile.restricted, perform: { _ in
                    zoom += 1
                    zoom -= 1
                })
                
                RoomTileView(zoom: $zoom, tile: $currentTile, roomState: Binding.constant(.restricted))
                
            }
            .frame(width: 120)
        }
    }
}
