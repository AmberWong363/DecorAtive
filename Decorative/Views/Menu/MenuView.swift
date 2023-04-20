//
//  MenuView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 2/27/23.
//

import SwiftUI
import struct Kingfisher.KFImage
import FirebaseAuth

struct MenuView: View {
    
    @State var presentAlert = false
    @State private var folderName: String = ""
    @State var index: Int = 0
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        TabView {
            HomeView() .tabItem {
                
                Image(systemName: "house")
                Text("Home")
            }
            
            SettingsView().tabItem {
                Image(systemName: "gearshape")
                Text("Settings")
            }
        }
        
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


//    struct MenuView_Previews: PreviewProvider {
//        static var previews: some View {
//            MenuView()     .environmentObject(FolderList()).environmentObject(UserInfo())
//        }
//    }


//TextField("Name this folder", text: $rename)
//currentFolder.files.append(File(rename, parent: currentFolder))
