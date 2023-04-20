//
//  RoomTileView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 4/5/23.
//

import SwiftUI

struct RoomTileView: View {
    @Binding var zoom : Int
    @Binding var tile : Tile
    @Binding var roomState : roomState
    var color : Color {
        switch roomState {
        case .doors:
            return tile.selected ? Color.green.opacity(0.3) : Color.gray.opacity(0.3)
        case .windows:
            return tile.selected ? Color.green.opacity(0.3) : Color.gray.opacity(0.3)
        case .edit:
            return tile.restricted ? Color.red.opacity(0.3) : tile.selected ? Color.green.opacity(0.3) : Color.gray.opacity(0.3)
        }
    }
    var body: some View {
        ZStack {
            Rectangle()
                .frame(
                    width: (CGFloat(zoom*2)),
                    height: (CGFloat(zoom*2)))
                .foregroundColor(color)
                .border(width: tile.wallType[0] == .none ? 1 : 4, edges: [.top], color:
                            tile.wallType[0] == .wall ? Color.black :
                            tile.wallType[0] == .door ? Color.blue :
                            tile.wallType[0] == .window ? Color.red :
                            Color.gray.opacity(1)
                )
                .border(width: tile.wallType[1] == .none ? 1 : 4, edges: [.bottom], color:
                            tile.wallType[1] == .wall ? Color.black :
                            tile.wallType[1] == .door ? Color.blue :
                            tile.wallType[1] == .window ? Color.red :
                            Color.gray.opacity(1)
                )
                .border(width: tile.wallType[2] == .none ? 1 : 4, edges: [.trailing], color:
                            tile.wallType[2] == .wall ? Color.black :
                            tile.wallType[2] == .door ? Color.blue :
                            tile.wallType[2] == .window ? Color.red :
                            Color.gray.opacity(1)
                )
                .border(width: tile.wallType[3] == .none ? 1 : 4, edges: [.leading], color:
                            tile.wallType[3] == .wall ? Color.black :
                            tile.wallType[3] == .door ? Color.blue :
                            tile.wallType[3] == .window ? Color.red :
                            Color.gray.opacity(1)
                )
        }
    }
}

