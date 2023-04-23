//
//  HomeView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var root : Root
    @State var name : String = "Decor-Ative"
    
    var body: some View {
        
        ZStack{
            
            // background
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
                            
                            // app logo and name
                            Image("Logo5")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .top)
                                .ignoresSafeArea()
                            
                            Spacer()
                            
                            Text("\(name)")
                                .font(Font.largeTitle)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                            
                            // navigate to settingsView
                            VStack{
                                Image(systemName: "gearshape")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .onTapGesture {
                                        viewState.state = .settings
                                    }
                                
                                Text("Settings")
                            }
                            
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
                        
                        // Botton for creating a new File or Folder
                        VStack{
                            Menu{
                                
                                Button {
                                    root.folder.folders.append(Folder())
                                    root.folder = root.folder
                                } label: {
                                    HStack{
                                        Text("New Folder +")
                                    }
                                }
                                
                                Button {
                                    root.folder.files.append(File())
                                    root.folder = root.folder
                                } label: {
                                    HStack{
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



