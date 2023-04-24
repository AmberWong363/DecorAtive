//
//  ForgotPassword.swift
//  RealNewWaveStore
//
//  Created by Maya Taylor (student LM) on 2/6/23.
//

import SwiftUI
import FirebaseAuth

struct ForgotPassword: View {
    // retrieves the userEmail property from the userInfo object
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.blue)
            VStack {
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 200)
                Spacer()
                 // retrieves users email
                TextField("Email Address:" , text: $userInfo.userEmail).padding(.all)
                
                //sends the password reset request
                Button {
                    // calls Auth.auth().sendPasswordReset() which sends the request
                    Auth.auth().sendPasswordReset(withEmail: userInfo.userEmail) { error in
                        if let error = error {
                            print(error.localizedDescription)
                            //  If the password reset request is successful, the view state is set to .authenticate to go back to the authentication view
                        } else {
                            viewState.state = .authenticate
                        }
                    }
                } label: {
                    Text("Forgot Password").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                }.padding(.all)
                
                Button {
                    viewState.state = .authenticate
                } label: {
                    Text("< Back").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                }.padding(.all)
            }
        }
    }
}
