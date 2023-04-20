//
//  FurnitureSideView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/29/23.
//

import SwiftUI

struct FurnitureSideView: View {
    @Binding var furniture : Furniture
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.3))
            HStack {
                Image("\(furniture.imageIcon)")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(2)
                VStack {
                    Text("\(furniture.name)")
                        .padding(2)
                    Text("\(furniture.tileWidth) tiles x \(furniture.tileHeight) tiles")
                        .padding(2)
                }
                .padding()
            }
        }
        .border(Color.black, width: 2)
    }
}
