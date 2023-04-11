//
//  FurnitureSelectionView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/30/23.
//

import SwiftUI

struct FurnitureSelectionView: View {
    /*
     Finalized list for usage in actual app
     
     Furniture(name: "Queen Bed", tileWidth: 5, tileHeight: 7, image: "bed"),
     Furniture(name: "Twin Bed", tileWidth: 3, tileHeight: 6, image: "bed-twin"),
     Furniture(name: "King Bed", tileWidth: 7, tileHeight: 7, image: "bed"),
     Furniture(name: "Desk", tileWidth: 4, tileHeight: 2, image: "desk"),
     Furniture(name: "Nightstand", tileWidth: 2, tileHeight: 2, image: "nightstand"),
     Furniture(name: "Table (6)", tileWidth: 3, tileHeight: 6, image: "desk"),
     Furniture(name: "Table (4)", tileWidth: 3, tileHeight: 4, image: "desk"),
     Furniture(name: "Chair", tileWidth: 1, tileHeight: 1, image: "chair"),
     Furniture(name: "Couch", tileWidth: 8, tileHeight: 3, image: "couch"),
     Furniture(name: "Lamp", tileWidth: 1, tileHeight: 1, image: "lamp")
     */
    
    @StateObject var globalFurnitureList : FurnitureList = FurnitureList([
        Furniture(name: "Queen Bed", tileWidth: 5, tileHeight: 7, image: "bed"),
        Furniture(name: "Twin Bed", tileWidth: 3, tileHeight: 6, image: "bed-twin"),
        Furniture(name: "King Bed", tileWidth: 7, tileHeight: 7, image: "bed"),
        Furniture(name: "Desk", tileWidth: 4, tileHeight: 2, image: "desk"),
        Furniture(name: "Nightstand", tileWidth: 2, tileHeight: 2, image: "nightstand"),
        Furniture(name: "Table (6)", tileWidth: 3, tileHeight: 6, image: "desk"),
        Furniture(name: "Table (4)", tileWidth: 3, tileHeight: 4, image: "desk"),
        Furniture(name: "Chair", tileWidth: 1, tileHeight: 1, image: "chair"),
        Furniture(name: "Couch", tileWidth: 8, tileHeight: 3, image: "couch"),
        Furniture(name: "Lamp", tileWidth: 1, tileHeight: 1, image: "lamp")
    ])
    @StateObject var addedFurnitureList : FurnitureList = FurnitureList([])
    @EnvironmentObject var currentRoom : Room
    @EnvironmentObject var viewState : ViewState
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(globalFurnitureList.list.indices, id: \.self) { index in
                    HStack {
                        FurnitureSideView(furniture: $globalFurnitureList.list[index])
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding()
                            .onTapGesture {
                                if !currentRoom.furnitureList.contains(globalFurnitureList.list[index]) {
                                    currentRoom.furnitureList.list.append(globalFurnitureList.list[index])
                                } else {
                                    currentRoom.furnitureList.list[currentRoom.furnitureList.firstOf(globalFurnitureList.list[index])].quantity += 1
                                }
                            }
                    }
                }
                ForEach(addedFurnitureList.list.indices, id: \.self) { index in
                    HStack {
                        FurnitureSideView(furniture: $addedFurnitureList.list[index])
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding()
                            .onTapGesture {
                                if !currentRoom.furnitureList.contains(addedFurnitureList.list[index]) {
                                    currentRoom.furnitureList.list.append(addedFurnitureList.list[index])
                                } else {
                                    currentRoom.furnitureList.list[currentRoom.furnitureList.firstOf(addedFurnitureList.list[index])].quantity += 1
                                }
                            }
                    }
                }
            }
            Button {
                viewState.state = .room
            } label: {
                Text("Design")
                    .padding()
                    .foregroundColor(Color.accent)
                    .cornerRadius(15)
            }
        }
    }
}
