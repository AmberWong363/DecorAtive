//
//  MapExpansionView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 2/28/23.
//

import SwiftUI

struct MapExpansionView: View {
    @State var zoom = 10
    @State var isEditing : Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                MapView(zoom: $zoom)
                    .border(Color.accent, width: 8)
                Slider(value: .convert(from: $zoom), in: 0...100, step: 1)
                    .padding()
            }
        }
    }
}

