//
//  HomeView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var root : Root
    @State var name : String = "Decor-Ative"
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .frame(width: .infinity, height: .infinity, alignment: .topLeading)
                .foregroundColor(Color("grey1"))
                .ignoresSafeArea()
            
            HStack{
                Rectangle()
                    .frame(width: 50, height: .infinity, alignment: .topLeading)
                    .foregroundColor(Color("green1"))
                    .ignoresSafeArea()
                
                Spacer()
                
            }
            
            VStack(spacing: 0){
                
                ZStack{
                    
                    Rectangle()
                        .frame(height: 100, alignment: .center)
                        .foregroundColor(Color("grey1"))
                        .ignoresSafeArea()
                    Rectangle()
                        .frame(height: 80, alignment: .center)
                        .foregroundColor(Color.accentColor)
                    
                    VStack{
                        
                        
                        HStack{
                            
                            Spacer()
                            
                            Image("Logo5")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .top)
                                .ignoresSafeArea()
                            
                            Spacer()
                            
                            Text("\(name)")
                                .font(Font.largeTitle)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                        }
                        
                    }
                }
                
                HStack{
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 50, height: .infinity, alignment: .topLeading)
                            .foregroundColor(Color("green1"))
                            .ignoresSafeArea()
                        
                        VStack{
                            Menu{
                                
                                Button {
                                    root.folder.folders.append(Folder())
                                    root.folder = root.folder
                                } label: {
                                    HStack{
                                        Image("NewFolderIcon")
                                            .resizable()
                                        
                                        Text("New Folder +")
                                    }
                                }
                                
                                Button {
                                    root.folder.files.append(File())
                                    root.folder = root.folder
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



