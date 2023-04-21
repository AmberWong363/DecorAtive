//
//  SettingsView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/6/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

struct SettingsView: View {
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    @State var showSheet: Bool = false
    var name = ""
    @State var editMode = false
    @ObservedObject var login = Login()
    @State private var showPassword = false

    
    var body: some View {
        

        NavigationView {
        
            
        VStack {
            
            Spacer()
            Button {
                showSheet.toggle()
            } label: {
                ZStack {
                    Circle().foregroundColor(.accentColor).frame(width:220, height: 220, alignment: .center)
                Image(uiImage: userInfo.image).resizable().aspectRatio(contentMode: .fill).frame(width:200, height: 200, alignment: .center).clipShape(Circle())
            }
            }
          Spacer()
            Spacer()
          
                if editMode {
                   
                    TextField("Email", text: $userInfo.userEmail).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
                           .autocapitalization(.words)
                           .disableAutocorrection(true)
                    SecureField("Password", text: $userInfo.password).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
                           .autocapitalization(.words)
                           .disableAutocorrection(true)
                    
                       } else {
                           HStack {
                            Text("Email: ")
                           Text(userInfo.userEmail).font(.system(size: 20))
                           }
                           HStack {
                            Text("Password: ")
                           Text("********").font(.system(size: 20))
                           }
                HStack {
                    Toggle("", isOn: $userInfo.metric)
                    if userInfo.metric {
                    Text("ft")
                           }
                        else {
                        Text("m")
                           }
                           }
                       }
            
           
            
               
           
            Spacer()
         
               
    
            
            
            
       
        }.sheet(isPresented: $showSheet) {
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
           
            
                
            let storage = Storage.storage().reference().child("users/\(uid)")
           
                guard let imagedata = userInfo.image.jpegData(compressionQuality: 0.5) else { return }
                
                storage.putData(imagedata) { meta, error in
                    
                }
                
                
                login.updatePassword(password:  userInfo.password)

            
        } content: {
            ImagePicker(selectedImage: self.$userInfo.image)
        }
        .navigationTitle(Text("Settings")) .navigationBarTitleDisplayMode(.inline).toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
//                EditButton()
                Button(action: {
                           self.editMode.toggle()
                       }) {
                           Text(editMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
                               .foregroundColor(Color.accentColor)
                       }
                   
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    try! Auth.auth().signOut()
                    viewState = .authenticate
                    userInfo.loggedIn = false
                } label: {
                    Text("Log Out")
                }
                
              }
            
            
            }
        }
        }
    
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
       
        SettingsView(viewState: Binding.constant(.authenticate))
    }
}

