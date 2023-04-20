//
//  MapView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 2/28/23.
//

import SwiftUI

struct MapView: View {
    
    @Binding var zoom : Int
    @State var currentTileIndices : (Int, Int)? = nil
    @EnvironmentObject var map : Map
    
    var body: some View {
        ZStack {
            ScrollView {
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(map.array.indices, id: \.self) { index in
                            VStack(spacing: 0) {
                                ForEach(map.array[index].indices, id: \.self) { i in
                                    TileView(indices: (index, i), tile: $map.array[index][i], zoom: $zoom)
                                        
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

