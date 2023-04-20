//
//  FurnitureSmallView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 4/7/23.
//

import SwiftUI

struct FurnitureSmallView: View {
    @Binding var furniture : Furniture
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.3))
                .frame(width: 80, height: 80)
                .padding(1)
            VStack {
                Text("\(furniture.name)")
                    .font(Font.custom("furniture", fixedSize: 8))
                Image("\(furniture.imageIcon)")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
        }
    }
}
