//
//  RoomTileEditView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 4/7/23.
//

import SwiftUI

struct RoomTileEditView: View {
    @Binding var currentTile : Tile
    var body: some View {
        VStack {
            HStack {
                // Top
                VStack {
                    Text("Top Wall")
                    Picker(selection: $currentTile.wallType[0]) {
                        Text("None").tag(wallType.none)
                        Text("Door").tag(wallType.door)
                        Text("Wall").tag(wallType.wall)
                        Text("Window").tag(wallType.window)
                    } label: {
                        Text("Top Wall")
                    }
                }
                // Bottom
                VStack {
                    Text("Bottom Wall")
                    Picker(selection: $currentTile.wallType[1]) {
                        Text("None").tag(wallType.none)
                        Text("Door").tag(wallType.door)
                        Text("Wall").tag(wallType.wall)
                        Text("Window").tag(wallType.window)
                    } label: {
                        Text("Bottom Wall")
                    }
                }
            }
            HStack {
                // Trailing
                VStack {
                    Text("Right Wall")
                    Picker(selection: $currentTile.wallType[2]) {
                        Text("None").tag(wallType.none)
                        Text("Door").tag(wallType.door)
                        Text("Wall").tag(wallType.wall)
                        Text("Window").tag(wallType.window)
                    } label: {
                        Text("Right Wall")
                    }
                }
                // Leading
                VStack {
                    Text("Left Wall")
                    Picker(selection: $currentTile.wallType[3]) {
                        Text("None").tag(wallType.none)
                        Text("Door").tag(wallType.door)
                        Text("Wall").tag(wallType.wall)
                        Text("Window").tag(wallType.window)
                    } label: {
                        Text("Left Wall")
                    }
                }
            }
            
            Toggle(isOn: $currentTile.restricted) {
                Text("Restrict")
                    .foregroundColor(Color.red)
            }
            
            RoomTileView(zoom: Binding.constant(20), tile: $currentTile, roomState: Binding.constant(.restricted))
            
        }
        .frame(width: 120)
    }
}
