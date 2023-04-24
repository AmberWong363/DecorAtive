//
//  FolderListView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/8/23.
//

import SwiftUI
import UIKit
import MessageUI

    
struct FolderView: View {
    @State var rename: Bool = false
    @Binding var folder: Folder
    @EnvironmentObject var root : Root
    @EnvironmentObject var viewState: ViewState
    @State private var isShowingShareSheet = false
    
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(height: 60, alignment: .center)
                .foregroundColor(Color.accentColor)
                .cornerRadius(8)
            
            HStack(){
                // folder Icon - navigate to folder
                Image("folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50.0, height: 50.0)
                    .padding()
                    .onTapGesture {
                        root.previous.append(root.folder)
                        root.folder = folder
                    }
                // Folder Name
                if rename == false {
                    Text("\(folder.name)")
                        .font(Font.title2)
                        .padding()
                } else {
                    TextField("Type something here...", text: $folder.name)
                        .padding(.vertical)
                        .zIndex(5)
                        .onSubmit {
                            rename = false
                        }
                        
                }
                 
                Spacer()
                
                // Drop Down Actions Menu

                Menu {
                     
                    Button {
                        rename.toggle()
                    } label: {
                        Text("Rename")
                    }
                   
                   Button("Share") {
                       let activityViewController = share(object: root.folder)
                       UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
                       
                   }
                    Button {
                        MakeACopy()
                    } label: {
                        Text("Make a Copy")
                    }
                }
                label: {
                    Image("options")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(width: 60, height: 60, alignment: .trailing)
                }
                
            }
            
        }
        
    }
    
    func MakeACopy() {
        root.folder.folders.append(Folder("Copy Of \(folder.name)", files: folder.files, folders: folder.folders))
        root.folder = root.folder
    }
    func share(object: Folder) -> UIActivityViewController {
        let shareText = "Check out this object: \(object.name)"
        let shareImage = UIImage(named: "objectImage")
        let activityViewController = UIActivityViewController(activityItems: [shareText, shareImage], applicationActivities: nil)
        return activityViewController
    }

    
    }

    
  

    
