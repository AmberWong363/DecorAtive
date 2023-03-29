//
//  HomeView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI

struct HomeView: View {
   
    @Binding var index: Int
   
    @EnvironmentObject var folders: FolderList
    @Binding var folder: Folder
    var body: some View {
        NavigationView {
         
        ScrollView{
            
            ForEach($folders.folders.indices){ index in
            NavigationLink {
               FolderListView(folder: $folders.folders[index])
                    .padding([.bottom],5)
                } label : {
                    HStack(alignment: .top){
                        Image(systemName: "folder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color.black)
                            .frame(width: 50, height: 50)
                            .clipShape(Rectangle())


                        Text(folder.name)
                            .foregroundColor(Color.black)
                                .padding([.trailing, .leading])
                          Spacer()
                        
                    }  .buttonStyle(PlainButtonStyle())
            }
        
                    }
                    
            }
            }
        }
        
        
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView( index: Binding.constant(0), folder: Binding.constant(Folder()))
//         .environmentObject(FolderList())
    }
}

