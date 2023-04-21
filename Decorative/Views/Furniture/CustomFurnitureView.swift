//
//  CustomFurnitureView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/31/23.
//

import SwiftUI

struct CustomFurnitureView: View {
    @EnvironmentObject var addedFurnitureList : FurnitureList
    @EnvironmentObject var viewState : ViewState
    @State var name : String = ""
    @State var size : (Int, Int) = (0, 0)
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.3))
            
            VStack {
                HStack {
                    Text("< Back")
                        .onTapGesture {
                            viewState.state = .furniture
                        }
                        .padding()
                        .foregroundColor(Color.accent)
                    Spacer()
                }
                
                TextField("Custom Furniture Name", text: $name)
                    .padding()
                
                VStack(spacing: 0) {
                    ForEach(0..<size.0, id: \.self) { _ in
                        HStack(spacing: 0) {
                            ForEach(0..<size.1, id: \.self) { _ in
                                Rectangle()
                                    .foregroundColor(Color.gray.opacity(0.5))
                                    .frame(width: 20, height: 20)
                                    .border(Color.black.opacity(0.7))
                            }
                        }
                    }
                }
                
                Slider(value: .convert(from: $size.0), in: 0...15, step: 1)
                    .padding()
                Slider(value: .convert(from: $size.1), in: 0...15, step: 1)
                    .padding()
                
                Button {
                    addedFurnitureList.list.append(Furniture(name: name, tileWidth: size.0, tileHeight: size.1, image: "nightstand"))
                    viewState.state = .furniture
                } label: {
                    Text("Add Furniture")
                        .font(Font.custom("Generate Room Font", fixedSize: 15))
                        .frame(width: 120, height: 50)
                        .background(Color.accent)
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                }

            }
        }
    }
}
