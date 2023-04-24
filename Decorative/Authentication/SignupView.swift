//
//  SignupView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/19/23.
//

import SwiftUI
import FirebaseAuth


struct SignupView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var userInfo: UserInfo
 
    var body: some View {
      
            VStack {
                Spacer()
                Image("Icon-1").resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).frame(width: 300, height: 300, alignment: .center)
                Spacer()
               
                // TextField and SecureField for email and password input
                TextField("Email Address" , text: $userInfo.userEmail).padding(.all).disableAutocorrection(true).autocapitalization(.none)
                
                SecureField("Password" , text: $userInfo.password).padding(.all).disableAutocorrection(true).autocapitalization(.none)
                // if the login is successful, the viewState.state property is updated to .menu
               // calls the createUser method of Firebase Authentication
                Button {
                    Auth.auth().createUser(withEmail: userInfo.userEmail, password: userInfo.password) { user, error in
                //  If successful, the viewState.state property is updated to .login
                        if let _ = user {
                print("success")
                    viewState.state = .login
                    } else {
                        print(error?.localizedDescription as Any)
                        }
                        }
                } label: {
                Text("Sign Up").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                                }.padding(.all)
                Button {
                    viewState.state = .authenticate
                } label: {
                    Text("< Back").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                }.padding(.all)
            }.background(
                LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                  .edgesIgnoringSafeArea(.all))
        
    }
}
