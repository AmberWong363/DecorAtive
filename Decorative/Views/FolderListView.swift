//
//  FolderListView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI

struct FolderListView: View {
    @Binding var folder: Folder
    
    var body: some View {
        HStack(alignment: .top){
            Image(systemName: "folder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Rectangle())


                Text(folder.name)
                    .padding([.trailing, .leading])
              Spacer()
            
        }.padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
}
}

struct FolderListView_Previews: PreviewProvider {
    static var previews: some View {
        FolderListView(folder: Binding.constant(Folder()))
    }
}
