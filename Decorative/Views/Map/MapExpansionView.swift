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
    @EnvironmentObject var map : Map
    @EnvironmentObject var currentRoom : Room
    @EnvironmentObject var viewState : ViewState
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                MapView(zoom: $zoom)
                    .border(Color.accent, width: 8)
                HStack {
                    Slider(value: .convert(from: $zoom), in: 0...100, step: 1)
                        .padding()
                    
                    Button {
                        currentRoom.room = map.generateRoomArray()
                        viewState.state = .furniture
                    } label: {
                        Text("Room")
                            .font(Font.custom("Generate Room Font", fixedSize: 15))
                            .frame(width: 120, height: 50)
                            .background(Color.accent)
                            .foregroundColor(Color.black)
                            .cornerRadius(10)
                    }
                    .padding()

                }
            }
        }
    }
}

