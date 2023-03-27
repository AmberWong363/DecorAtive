//
//  LoginView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/19/23.
//

import SwiftUI
import FirebaseAuth


struct LoginView: View {
    @Binding var viewState: ViewState
    @EnvironmentObject var userInfo: UserInfo
   
    
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.blue)
            VStack {
                Spacer()
                Image("").resizable().aspectRatio(contentMode: .fit).frame(width: 200)
                Spacer()
                    
                TextField("Username or Email Address:" , text: $userInfo.userEmail).padding(.all)
                
                SecureField("Password" , text: $userInfo.password).padding(.all)
                
                Button {
                    Auth.auth().signIn(withEmail: userInfo.userEmail, password: userInfo.password) { user, error in
                        if let _ = user{
                      print("success")
                        
                 } else{
                           print(error?.localizedDescription)
                    }

                                            }
                    
                } label: {
                    Text("Login").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                }.padding(.all)
                
                Button {
                    self.viewState = .forgotPassword
                } label: {
                    Text("Forgot Password").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                }.padding(.all)
                
                Button {
                    self.viewState = .authenticate
                } label: {
                    Text("< Back").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                }.padding(.all)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewState: Binding.constant(.login))
    }
}


