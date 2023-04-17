//
//  FurnitureRoomView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 4/7/23.
//

import SwiftUI

struct FurnitureRoomView: View {
    @Binding var furniture : Furniture
    @Binding var zoom : Int
    var body: some View {
        ZStack {
            Image("\(furniture.image)")
                .resizable()
                .rotationEffect(Angle(degrees: Double(furniture.angle)))
                .frame(
                    width: (CGFloat(zoom*2*furniture.tileWidth)),
                    height: (CGFloat(zoom*2*furniture.tileHeight)))
                .border(Color.red, width: 5)
        }
    }
}
