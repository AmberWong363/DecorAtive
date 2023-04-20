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
    @EnvironmentObject var viewState : ViewState
    var body: some View {
        HStack {
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
            
            Button {
                viewState.state = .furniture
            } label: {
                Text("Add More")
                    .font(Font.custom("hidas", fixedSize: 15))
                    .padding()
                    .frame(width: 90)
                    .background(Color.accent)
                    .foregroundColor(Color.black)
                    .cornerRadius(15)
            }
            .padding()
        }
    }
}
