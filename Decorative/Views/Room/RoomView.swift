//
//  RoomView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 4/5/23.
//

import SwiftUI

struct RoomView: View {
    @Binding var zoom : Int
    @Binding var roomState : roomState
    @Binding var currentFurniture : Furniture?
    @Binding var currentTile : Tile
    @State var lastClicked : (Int, Int) = (-1, -1)
    @EnvironmentObject var currentRoom : Room
    var body: some View {
        ZStack {
            ScrollView {
                ScrollView(.horizontal) {
                    ZStack {
                        HStack(spacing: 0) {
                            ForEach(currentRoom.room.indices, id: \.self) { index in
                                VStack(spacing: 0) {
                                    // Room Tiles
                                    ForEach(currentRoom.room[index].indices, id: \.self) { i in
                                        RoomTileView(zoom: $zoom, tile: $currentRoom.room[index][i], roomState: $roomState)
                                            .onTapGesture {
                                                if (index, i) != lastClicked {
                                                    currentFurniture = nil
                                                    currentTile = currentRoom.room[index][i]
                                                    lastClicked = (index, i)
                                                } else {
                                                    currentTile = Tile(value: -1)
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        ZStack {
                            // Furniture
                            ForEach(currentRoom.furnitureList.list.indices, id: \.self) { index in
                                if currentRoom.furnitureList.list[index].inRoom {
                                    HStack(spacing: 0) {
                                        VStack(spacing: 0) {
                                            FurnitureRoomView(furniture: $currentRoom.furnitureList.list[index], zoom: $zoom)
                                                .offset(x:
                                                            CGFloat(zoom*2*currentRoom.furnitureList.list[index].position.0),
                                                        y:
                                                            CGFloat(zoom*2 * currentRoom.furnitureList.list[index].position.1)
                                                )
                                                .onTapGesture {
                                                    if currentFurniture == nil || !(currentFurniture! == currentRoom.furnitureList.list[index]) {
                                                        currentTile = Tile(value: -1)
                                                        currentFurniture = currentRoom.furnitureList.list[index]
                                                    } else {
                                                        currentFurniture = nil
                                                    }
                                                }
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }
            .onAppear {
                currentRoom.getWallBorders()
                zoom += 1
                zoom -= 1
            }
        }
    }
        
}


