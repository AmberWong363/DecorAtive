//
//  NewFolderView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI

struct NewFolderView: View {
    @State var folderName: String = ""
    @Binding var currentFolder: Folder
  
    var body: some View {
        TextField("Name your folder", text: $folderName)
            .padding(.all)
        
        Button("Create", action: {
            _ = Folder(folderName, parent: currentFolder, files: [])
        })
       
        
       
        
         
            }
    }


struct NewFolderView_Previews: PreviewProvider {
    static var previews: some View {
        NewFolderView(currentFolder: Binding.constant(Folder()))
    }
}
