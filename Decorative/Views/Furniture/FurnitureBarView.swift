//
//  FurnitureBarView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 4/7/23.
//

import SwiftUI

struct FurnitureBarView: View {
    @Binding var furnitureList : FurnitureList
    @Binding var zoom : Int
    var body: some View {
        ZStack {
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(furnitureList.list.indices, id: \.self) { index in
                        FurnitureSmallView(furniture: $furnitureList.list[index])
                            .onTapGesture {
                                furnitureList.list[index].inRoom.toggle()
                                zoom += 1
                                zoom -= 1
                            }
                    }
                }
            }
        }
    }
}
