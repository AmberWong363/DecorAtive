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
                
                Slider(value: .convert(from: $zoom), in: 10...100, step: 1)
                    .padding()
            }
        }
    }
}
