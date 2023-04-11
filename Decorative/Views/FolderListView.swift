//
//  FolderListView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/16/23.
//

import SwiftUI
struct FolderListView: View {
    @EnvironmentObject var root : Root
    var body: some View {
        VStack {
            Button {
                if !root.previous.isEmpty {
                    root.folder = root.previous.last!
                    root.previous.removeLast()
                }
            } label: {
                Text("Back")
            }
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(root.folder.folders.indices, id: \.self) { index in
                        FolderView(folder: $root.folder.folders[index])
                            .onLongPressGesture {
                                root.previous.append(root.folder)
                                root.folder = root.folder.folders[index]
                            }
                    }
                }
            }
        }
    }
}


//struct FolderListView: View {
//
//    @Binding var folder: File
//
////    @StateObject var folder: Folder = Folder("p1", parent: nil, files: [Folder(), File(), File()])
//
//    //    var currentFolder: Folder {
//    //        get { return folder }
//    //        set { folder = newValue }
//    //    }
//
//    var body: some View {
//
//
//        VStack {
//            ZStack{
//                Rectangle()
//                    .frame(width: .infinity, height: 60, alignment: .top)
//                    .ignoresSafeArea()
//                    .foregroundColor(Color.gray)
//
//                HStack{
//                    if folder.parent != nil {
//                        Button {
//
//                            folder.name = folder.parent!.name
//                            folder.files = folder.parent!.files
//
//                            if folder.parent!.parent != nil {
//                                folder.parent = folder.parent!.parent
//                            }
//                        } label: {
//                            Text("<- Back")
//                        }
//                    }
//                }
//            }
//
//            ScrollView {
//                ForEach(folder.files!.indices, id: \.self) { index in
//                    VStack {
//                        if folder.files![index].files != nil {
//                            FolderView(folder: folder.files![index] as! Binding<File>)
//                        }else {
//                            FileView(file: folder.files![index] as! Binding<File>)
//                        }
//                    }
//                }
//                //                    if folder.files[index].isKindOfClass(Folder) {
//                //                        FolderView(file: $folder.files[index])
//                //                    } else {
//                //                        FileView(file: $folder.files[index])
//                //                    }
//            }
//        }
//
//
//
//
//
//
//
//        //        HStack(alignment: .top){
//        //            Image(systemName: "folder")
//        //                .resizable()
//        //                .aspectRatio(contentMode: .fill)
//        //                .frame(width: 50, height: 50)
//        //                .clipShape(Rectangle())
//        //
//        //
//        //            Text(folder.name)
//        //                .padding([.trailing, .leading])
//        //            Spacer()
//        //
//        //        }.padding()
//        //            .background(Color.gray.opacity(0.1))
//        //            .cornerRadius(8)
//    }
//}
//
