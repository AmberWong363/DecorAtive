//
//  MenuView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 2/27/23.
//

import SwiftUI
import struct Kingfisher.KFImage
import FirebaseAuth

enum ViewState {
    case authenticate, signup, login, forgotPassword, settings
}

struct MenuView: View {
   
    @State var presentAlert = false
    @State private var folderName: String = ""
//    @EnvironmentObject var folders: FolderList
    @State var index: Int = 0
    @State var viewState: ViewState = .authenticate
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
       
        if viewState == .authenticate {
            AuthenticationView(viewState: $viewState)
        }
        else if viewState == .login && !userInfo.loggedIn  {
           LoginView(viewState: $viewState)
        }
        else if viewState == .signup && !userInfo.loggedIn  {
            SignupView(viewState: $viewState)
        }
//        else if viewState == .forgotPassword && !userInfo.loggedIn  {
//            ForgotPassword(viewState: $viewState)
//        }
        else if viewState == .settings && userInfo.loggedIn {
            SettingsView(viewState: $viewState)
        }
        else {
        
            
//                GeometryReader { geometry in
//                Text("")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .multilineTextAlignment(.leading)
//                    .lineLimit(nil)
//                    .frame(width: geometry.size.width * 0.25, height: geometry.size.height)
//                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
//                }
        
         
                    
                    TabView {
                        
                        
//                        HomeView( index: $index, folder: $folders.folders[index]) .tabItem {
//                            Image(systemName: "house")
//                            Text("Home")
//                        }
                        
                        SettingsView( viewState: $viewState) .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
                    
                
                    }
                   
                    
//                    Button {
//                presentAlert = true
//
//
//                }
//                        label : {
//                    Image(systemName: "plus.circle")
//                        .resizable()
//                        .padding(1.0)
//                        .frame(width: 50.0, height: 50.0)
//                        .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).position(x: 40)
//                }
//                .alert("New Folder", isPresented: $presentAlert, actions: {
//
//                          Button("Create", action: {
//
//                          })
//                          Button("Cancel", role: .cancel, action: {})
//                      }, message: {
//                          Text("Do you want to create a new folder?")
//                      })
//                Button {
//
//                } label : {
//                    Image(systemName: "square.and.arrow.down").resizable().padding(1.0).frame(width: 50.0, height: 50.0).accentColor(.blue).position(x: 40)
//                }
//
//                    TextField("Type here",  text: $folderName)
//
            
//
            
          
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                   Button("First") {
                                       
                                   }

                                   Spacer()

                                   Button("Second") {
                                       
                                   }
                               }
                           }
                
            
            
        }
        
     
}
}


//    struct MenuView_Previews: PreviewProvider {
//        static var previews: some View {
//            MenuView()     .environmentObject(FolderList()).environmentObject(UserInfo())
//        }
//    }


//TextField("Name this folder", text: $rename)
//currentFolder.files.append(File(rename, parent: currentFolder))
