//
//  TileView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/2/23.
//

import SwiftUI

struct TileView: View {
    var indices : (Int, Int)
    @Binding var tile : Tile
    @Binding var zoom : Int
    @EnvironmentObject var map : Map
    @EnvironmentObject var user : User
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(tile.inner!.indices, id: \.self) { index in
                    HStack(spacing: 0) {
                        ForEach(tile.inner![0].indices, id: \.self) { i in
                            Rectangle()
                                .frame(
                                    width: (CGFloat(zoom*2) + 20)/3,
                                    height: (CGFloat(zoom*2) + 20)/3)
                                .foregroundColor(
                                    zoom > 40 ?
                                    tile.inner![index][i].selected ? Color.green.opacity(0.3) : Color.gray.opacity(0.3)
                                    : tile.selected ? Color.green.opacity(0.3) : Color.gray.opacity(0.3)
                                    
                                )
                                .border(
                                    zoom > 40 ? tile.inner![index][i].createSelect ? Color.accent.opacity(0.8) : Color.gray.opacity(1) :
                                        Color.gray.opacity(0),
                                    width: 1
                                )
                                .onTapGesture {
                                    if (zoom < 40) {
                                        map.array[indices.0][indices.1].createSelect.toggle()
                                        
                                        if user.selectedTile == nil {
                                            user.selectedTile = indices
                                        } else {
                                            map.generateRectangleArea(tile1Indices: user.selectedTile ?? (0, 0), tile2Indices: indices)
                                            
                                            map.array[indices.0][indices.1].createSelect.toggle()
                                            map.array[user.selectedTile!.0][user.selectedTile!.1].createSelect.toggle()
                                            user.selectedTile = nil
                                        }
                                    } else {
//                                        print(user.selectedSpecialTile)
//                                        print(indices.0 * 3 + i)
//                                        print(indices.1 * 3 + index)
//                                        print()
                                        
                                        map.extendedArray[indices.0 * 3 + i][indices.1 * 3 + index].createSelect.toggle()
                                        
                                        if user.selectedSpecialTile == nil {
                                            user.selectedSpecialTile = (indices.0 * 3 + i, indices.1 * 3 + index)
                                        } else {
                                            map.generateExtendedRectangleArea(tile1Indices: user.selectedSpecialTile ?? (0, 0), tile2Indices: (indices.0 * 3 + i, indices.1 * 3 + index))
                                            
                                            map.extendedArray[indices.0 * 3 + i][indices.1 * 3 + index].createSelect.toggle()
                                            map.extendedArray[user.selectedSpecialTile!.0][user.selectedSpecialTile!.1].createSelect.toggle()
                                            user.selectedSpecialTile = nil
                                        }
                                    }
                                    
                                    zoom += 1
                                    zoom -= 1
                                }
                        }
                    }
                }
            }
        }
        .border(tile.createSelect ? Color.accent.opacity(0.5) : Color.gray.opacity(0.8), width: 2)
    }
}

