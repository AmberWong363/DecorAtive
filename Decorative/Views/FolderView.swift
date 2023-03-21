//
//  FolderListView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/8/23.
//

import SwiftUI

struct FolderView: View {
    @Binding var folder: Folder

    
    var body: some View {
        NavigationView {
            HStack(alignment: .top){
                
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50.0, height: 50.0)
                    .clipShape(Rectangle())
                
                VStack(alignment: .leading){
                    Text(folder.name)
                        .padding([.trailing, .leading])
                }
                Spacer()
            }.padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
    }
}
}

struct FolderView_Previews: PreviewProvider {
    static var previews: some View {
        FolderView(folder: Binding.constant(Folder()))
    }
}
