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
    @EnvironmentObject var userInfo : UserInfo
    @EnvironmentObject var viewState : ViewState
    @State var showSheet: Bool = false
    var name = ""
    @State var editMode = false
    @ObservedObject var login = Login()
    @State private var showPassword = false
    
    
    var body: some View {

        VStack(spacing: 0) {
            //create header
            ZStack{
                
                Rectangle()
                    .frame(height: 100, alignment: .center)
                    .foregroundColor(Color("grey1"))
                    .ignoresSafeArea()
                    
                Rectangle()
                    .frame(height: 82, alignment: .center)
                    .foregroundColor(Color.accentColor)
                
                VStack{
                    
                    
                    HStack{
                        
                        Spacer()
                        //displays logo at the top
                        Image("Logo5")
                            .resizable()
                            .frame(width: 60, height: 60, alignment: .center)
                            .ignoresSafeArea()
                        
                        Spacer()
                        //displays app name at the top
                        Text("Decor-Ative")
                            .font(Font.largeTitle)
                            .foregroundColor(Color.black)
                        
                        Spacer()
                        
                        VStack{
                            //displays home button at the top
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .onTapGesture {
                                    viewState.state = .menu
                                }
                                
                            
                            Text("Home")
                        }.padding()
                        
                        
                        Spacer()
                    }
                    
                }
            }
            //creates a form that allows the user to edit their profile
            NavigationView {
                
                Form {
                    
              //user can upload a profile picture by tapping on a button that presents a sheet containing an ImagePicker view
                    Section(header: Text("Profile")) {
                        Button {
                            showSheet.toggle()
                        } label: {
                            ZStack {
                                Image(uiImage: userInfo.image).resizable().aspectRatio(contentMode: .fill).frame(width: 300.0, height: 300.0, alignment: .center)
                                Image(systemName: "camera").resizable().aspectRatio(contentMode: .fill).frame(width: 20, height: 50).position(x: 280, y: 280)
                            }
                        }
                        
                        
                        .sheet(isPresented: $showSheet) {
                            //retrieves user id of authenticated user
                            guard let uid = Auth.auth().currentUser?.uid else { return }
                            
                            
                            //creates a reference to a Firebase Storage path that corresponds to the user's profile image
                            let storage = Storage.storage().reference().child("users/\(uid)")
                            //converts the user's new profile image to JPEG data
                            guard let imagedata = userInfo.image.jpegData(compressionQuality: 0.5) else { return }
                            //saves it to Firebase Storage using the putData method
                            storage.putData(imagedata) { meta, error in
                                
                            }
                            
                            //updates password
                            login.updatePassword(password:  userInfo.password)
                            
                            
                        } content: {
                            //changes image to the one picked
                            ImagePicker(selectedImage: self.$userInfo.image)
                        }
                        
                    }
                    //if true the view shows text fields for the email and password fields
                    if editMode {
                        //editable email and password
                        TextField("Email", text: $userInfo.userEmail)
                            .font(Font.body)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.words)
                            .disableAutocorrection(true)
                        SecureField("Password", text: $userInfo.password).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(Font.body)
                            .autocapitalization(.words)
                            .disableAutocorrection(true)
                    //if false the view shows static text fields for the email and password fields
                        
                    } else {
                        //static email and password
                        HStack {
                            
                            Text("Email: ")
                            Spacer()
                            Text(userInfo.userEmail).font(Font.body)
                            Spacer()
                        }
                        HStack {
                            
                            Text("Password: ")
                            Spacer()
                            Text("********").font(Font.title2)
                            Spacer()
                        }
                    
                    }
                    Spacer()
                }
                //sets the background color to grey and the preferred color scheme to light
                .foregroundColor(Color("grey1"))
                .navigationTitle(Text("Settings")) .navigationBarTitleDisplayMode(.inline).toolbar {
                    //tool bar at top of settingsview
                    ToolbarItem(placement: .navigation) {
                        //toggles editMode
                        Button(action: {
                            self.editMode.toggle()
                        }) {
                            Text(editMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
                                .foregroundColor(Color.accentColor)
                        }
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        //logs user out
                        Button {
                            try! Auth.auth().signOut()
                            viewState.state = .authenticate
                            userInfo.loggedIn = false
                        } label: {
                            Text("Log Out")
                        }
                    }
                }
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("grey1")/*@END_MENU_TOKEN@*/)
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
            }
            
        
        }
    }
}
