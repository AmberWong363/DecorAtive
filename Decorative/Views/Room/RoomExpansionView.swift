//
//  RoomExpansionView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 4/7/23.
//

import SwiftUI

struct RoomExpansionView: View {
    @State var zoom : Int = 20
    @State var roomState : roomState = .walls
    @EnvironmentObject var viewState : ViewState
    @EnvironmentObject var currentRoom : Room
    @State var currentFurniture : Furniture? = nil
    @State var currentTile : Tile = Tile(value: -1)
    var body: some View {
        ZStack {
            VStack{
                FurnitureBarView(furnitureList: $currentRoom.furnitureList, zoom: $zoom)
                
                HStack {
                    if !(currentTile == Tile(value: -1)) {
                        RoomTileEditView(currentTile: $currentTile)
                    } else if currentFurniture != nil {
                        FurnitureEditView(furniture: $currentFurniture, zoom: $zoom)
                    } else {
                        VStack {
                            Text("Select a Tile or Furniture")
                        }
                        .frame(width: 120)
                    }
                    
                    RoomView(zoom: $zoom, roomState: $roomState, currentFurniture: $currentFurniture, currentTile: $currentTile)
                        .padding()
                }
                
                Slider(value: .convert(from: $zoom), in: 20...100, step: 1)
                    .padding()
            }
        }
    }
}
