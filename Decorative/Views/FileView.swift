//
//  FileView.swift
//  Decorative
//
//  Created by Reuben Gottesman (student LM) on 3/23/23.
//

import SwiftUI

struct FileView: View {
    @Binding var file: File

    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(width: .infinity, height: 60, alignment: .center)
                .foregroundColor(Color.orange)
                .cornerRadius(8)
            
            HStack(){
                
                Image("file")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50.0, height: 50.0)
                    .padding()
                
                Text("\(file.name)")
                    .font(Font.title2)
                    .padding()
                
                Spacer()
                
                
                
                
                Menu {
                    
                    Button {
                        Rename()
                    } label: {
                        Text("rename")
                    }
                    
                    Button {
                        MoveTo()
                    } label: {
                        Text("Move To ->")
                    }
                    Button {
                        Share()
                    } label: {
                        Text("Share")
                    }
                    Button {
                        MakeACopy()
                    } label: {
                        Text("Make a Copy")
                    }
                    

                } label: {
                    Image("options")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(width: 60, height: 60, alignment: .trailing)
                }
                
                
            }
        }
    }
    func Rename() {
        //
    }
    func MoveTo() {
        //
    }
    func Share() {
        //
    }
    func MakeACopy() {
        //
    }
}

