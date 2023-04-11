//
//  SignupView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/19/23.
//

import SwiftUI
import FirebaseAuth


struct SignupView: View {
    @Binding var viewState: ViewState
    @EnvironmentObject var userInfo: UserInfo
 
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.blue)
            VStack {
                Spacer()
                Image("Icon").resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).frame(width: 300, height: 300, alignment: .center)
                Spacer()
                TextField("Username" , text: $userInfo.username).padding(.all)
               
                
                TextField("Email Address" , text: $userInfo.userEmail).padding(.all).disableAutocorrection(true)
                
                SecureField("Password" , text: $userInfo.password).padding(.all)
                
                Button {
                    Auth.auth().createUser(withEmail: userInfo.userEmail, password: userInfo.password) { user, error in
                if let _ = user {
                print("success")
                    viewState = .login
                    } else {
                        print(error?.localizedDescription as Any)
                        }
                        }
                } label: {
                Text("Sign Up").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewState: Binding.constant(.signup))
    }
}
