//
//  MapView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 2/28/23.
//

import SwiftUI

struct MapView: View {
    
    @Binding var zoom : Int
    @StateObject var map : Map = Map()
    
    var body: some View {
        ZStack {
            ScrollView {
                ScrollView(.horizontal) {
                    VStack(spacing: 0) {
                        ForEach(map.array.indices, id: \.self) { index in
                            HStack(spacing: 0) {
                                ForEach(map.array[index].indices, id: \.self) { i in
                                    TileView(tile: $map.array[index][i], zoom: $zoom)
                                }
                                
                            }
                        }
                        
                    }
                }
            }
            .padding()
        }
    }
}

