//
//  HomeView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var baseFolder: File = File("p1", parent: nil, files: [File(), File()])
    let num = 2
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .frame(width: .infinity, height: .infinity, alignment: .topLeading)
                .foregroundColor(Color.brown)
                .ignoresSafeArea()
            
            HStack{
                Rectangle()
                    .frame(width: 50, height: .infinity, alignment: .topLeading)
                    .foregroundColor(Color.green)
                    .ignoresSafeArea()
                
                 Spacer()
                
            }
            
            VStack(spacing: 0){
                
                ZStack{
                    Rectangle()
                        .frame(height: 100, alignment: .center)
                        .foregroundColor(Color.brown)
                        .ignoresSafeArea()
                    Rectangle()
                        .frame(height: 100, alignment: .center)
                        .foregroundColor(Color.accentColor)
                    //                    .ignoresSafeArea()
                    
                    HStack{
                        Image("Logo5")
                            .resizable()
                            .frame(width: 60, height: 60, alignment: .top)
                            .padding()
                            .ignoresSafeArea()
                        
                        Text("Decor-Ative")
                            .font(Font.largeTitle)
                            .foregroundColor(Color.black)
                        
                        Spacer()
                    }
                }
                
                HStack{
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 50, height: .infinity, alignment: .topLeading)
                            .foregroundColor(Color.green)
                            .ignoresSafeArea()
                        
                        VStack{
                            Menu{
                                
                                Button {
                                    //
                                } label: {
                                    HStack{
                                        Image("NewFolderIcon")
                                            .resizable()
                                        
                                        Text("New Folder +")
                                    }
                                }
                                
                                Button {
                                    //
                                } label: {
                                    HStack{
                                        Image("NewFileIcon")
                                            .resizable()
                                        
                                        Text("New Room File +")
                                    }
                                }

                                
                                
                            } label: {
                                Image("AddNewIcon")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                            }
                            
                            Spacer()
                        }
                        
                    }
                    
                    FolderListView()
                    
                }
                Spacer()
                
            }
        }
    }
    
    
}



