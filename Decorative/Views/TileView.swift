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
            if let t = tile.inner {
                ZStack {
                    VStack(spacing: 0) {
                        ForEach(t.indices, id: \.self) { index in
                            HStack(spacing: 0) {
                                ForEach(t[index].indices, id: \.self) { i in
                                    Rectangle()
                                        .frame(
                                            width: (CGFloat(zoom*2) + 20)/3,
                                            height: (CGFloat(zoom*2) + 20)/3)
                                        .foregroundColor(tile.selected ? Color.green.opacity(0.3) : Color.gray.opacity(0.3))
                                        .border(tile.createSelect ? Color.accent.opacity(zoom < 40 ? 0 : 0.5) : .gray.opacity(zoom < 40 ? 0 : 1), width: 1)
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
                                                
                                            }
                                            
                                            zoom += 1
                                            zoom -= 1
                                        }
                                }
                            }
                        }
                    }
                    .border(tile.createSelect ? Color.accent.opacity(0.5) : Color.black.opacity(0.5), width: 2)
                }
            }
        }
    }
}

