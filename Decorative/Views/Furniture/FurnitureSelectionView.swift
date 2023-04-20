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
    
    @State var elapsed : Bool = false
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
    @EnvironmentObject var addedFurnitureList : FurnitureList
    @EnvironmentObject var currentRoom : Room
    @EnvironmentObject var viewState : ViewState
    @State var currentFurnitureName : String = ""
    
    private func delayText() {
        // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
        elapsed = true
        Task {
            try? await Task.sleep(nanoseconds: 5_500_000_000)
            elapsed = false
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(height: 30)
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(globalFurnitureList.list.indices, id: \.self) { index in
                            HStack {
                                FurnitureSideView(furniture: $globalFurnitureList.list[index])
                                Image(systemName: "plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35)
                                    .padding()
                                    .onTapGesture {
                                        currentRoom.furnitureList.list.append(globalFurnitureList.list[index])
                                        currentFurnitureName = globalFurnitureList.list[index].name
                                        
                                        delayText()
                                    }
                            }
                        }
                        ForEach(addedFurnitureList.list.indices, id: \.self) { index in
                            HStack {
                                FurnitureSideView(furniture: $addedFurnitureList.list[index])
                                Image(systemName: "plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35)
                                    .padding()
                                    .onTapGesture {
                                        currentRoom.furnitureList.list.append(addedFurnitureList.list[index])
                                        currentFurnitureName = addedFurnitureList.list[index].name
                                        
                                        delayText()
                                    }
                            }
                        }
                        Button {
                            viewState.state = .custom
                        } label: {
                            Text("Custom Furniture")
                                .padding()
                                .foregroundColor(Color.black)
                                .background(Color.accent)
                                .cornerRadius(15)
                                .padding()
                        }
                        
                    }
                    Button {
                        viewState.state = .room
                    } label: {
                        Text("Design")
                            .padding()
                            .foregroundColor(Color.black)
                            .background(Color.accent)
                            .cornerRadius(15)
                    }
                }
            }
            
            VStack {
                Text(elapsed ? "Added \(currentFurnitureName)" : "")
                    .bold()
                    .foregroundColor(Color.red)
                    .padding()
                Spacer()
            }
        }
    }
}
