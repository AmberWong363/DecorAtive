//
//  TileView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/2/23.
//

import SwiftUI

struct TileView: View {
    @Binding var tile : Tile
    @Binding var zoom : Int
    var body: some View {
        ZStack {
            if let t = tile.inner {
                //                if zoom >= 80 && zoom != 101{
                //                    VStack(spacing: 0) {
                //                        ForEach(t.indices, id: \.self) { index in
                //                            HStack(spacing: 0) {
                //                                ForEach(t[index].indices, id: \.self) { i in
                //                                    TileView(tile:
                //                                                Binding.constant(t[index][i]), zoom:
                //                                                Binding.constant(101))
                //                                }
                //                            }
                //                        }
                //                    }
                //                }
                if zoom > 40 {
                    VStack(spacing: 0) {
                        ForEach(t.indices, id: \.self) { index in
                            HStack(spacing: 0) {
                                ForEach(t[index].indices, id: \.self) { i in
                                    Rectangle()
                                        .frame(
                                            width: (CGFloat(zoom*2) + 20)/3,
                                            height: (CGFloat(zoom*2) + 20)/3)
                                        .foregroundColor(Color.gray.opacity(0.3))
                                        .border(.gray, width: 1)
                                }
                            }
                        }
                    }
                    .border(Color.black.opacity(0.5), width: 2)
                } else {
                    Rectangle()
                        .frame(
                            width: (CGFloat(zoom*2) + 20),
                            height: (CGFloat(zoom*2) + 20))
                        .foregroundColor(Color.gray.opacity(0.3))
                        .border(Color.black.opacity(0.5), width: 2)
                }
                
            }
        }
    }
}

