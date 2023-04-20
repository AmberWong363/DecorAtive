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
                Image("Icon").resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).frame(width: 300, height: 300, alignment: .center)
                Spacer()
               
                
                TextField("Email Address" , text: $userInfo.userEmail).padding(.all).disableAutocorrection(true).autocapitalization(.none)
                
                SecureField("Password" , text: $userInfo.password).padding(.all).disableAutocorrection(true).autocapitalization(.none)
                
                Button {
                    Auth.auth().createUser(withEmail: userInfo.userEmail, password: userInfo.password) { user, error in
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
