//
//  FurnitureEditView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 4/7/23.
//

import SwiftUI

struct FurnitureEditView: View {
    @Binding var furniture : Furniture?
    @Binding var zoom : Int
    @State var subDistance : Int = 0
    @EnvironmentObject var currentRoom : Room
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 120)
                .foregroundColor(Color.black.opacity(0.8))
                .cornerRadius(20)
            VStack {
                HStack {
                    Image("Rotate")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Rotate")
                        .foregroundColor(Color.white)
                }
                .onTapGesture {
                    switch furniture!.facing {
                    case .up:
                        furniture!.facing = .right
                        furniture!.angle = 90
                        
                        furniture!.image = "\(furniture!.ogImageIcon)90"
                        
                        subDistance = furniture!.tileWidth
                        furniture!.tileWidth = furniture!.tileHeight
                        furniture!.tileHeight = subDistance
                    case .down:
                        furniture!.facing = .left
                        furniture!.angle = 270
                        
                        furniture!.image = "\(furniture!.ogImageIcon)270"
                        
                        subDistance = furniture!.tileWidth
                        furniture!.tileWidth = furniture!.tileHeight
                        furniture!.tileHeight = subDistance
                    case .left:
                        furniture!.facing = .up
                        furniture!.angle = 0
                        
                        furniture!.image = "\(furniture!.ogImageIcon)"
                        
                        subDistance = furniture!.tileWidth
                        furniture!.tileWidth = furniture!.tileHeight
                        furniture!.tileHeight = subDistance
                    case .right:
                        furniture!.facing = .down
                        furniture!.angle = 180
                        
                        furniture!.image = "\(furniture!.ogImageIcon)180"
                        
                        subDistance = furniture!.tileWidth
                        furniture!.tileWidth = furniture!.tileHeight
                        furniture!.tileHeight = subDistance
                    }
                    zoom += 1
                    zoom -= 1
                }
                
                VStack {
                    Image("up")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .onTapGesture {
                            if furniture!.position.1 != 0 {
                                furniture!.position.1 -= 1
                                zoom += 1
                                zoom -= 1
                            }
                        }
                    HStack {
                        Image("left")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .leading)
                            .onTapGesture {
                                if furniture!.position.0 != 0 {
                                    furniture!.position.0 -= 1
                                    zoom += 1
                                    zoom -= 1
                                }
                            }
                        Image("right")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .trailing)
                            .onTapGesture {
                                if furniture!.position.0 + furniture!.tileWidth
                                    != currentRoom.room.count {
                                    furniture!.position.0 += 1
                                    zoom += 1
                                    zoom -= 1
                                }
                            }
                    }
                    Image("down")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .onTapGesture {
                            if furniture!.position.1 + furniture!.tileHeight
                                != currentRoom.room[0].count {
                                furniture!.position.1 += 1
                                zoom += 1
                                zoom -= 1
                            }
                        }
                }
                
                Button {
                    zoom += 1
                    zoom -= 1
                    furniture!.inRoom = false
                } label: {
                    Text("Remove")
                        .padding()
                        .frame(width: 100, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(20)
                }
            }
            .padding(.vertical)
            .frame(width: 120)
        }
    }
}

