//
//  ForgotPassword.swift
//  RealNewWaveStore
//
//  Created by Maya Taylor (student LM) on 2/6/23.
//

import SwiftUI
import FirebaseAuth

struct ForgotPassword: View {
    @Binding var viewState: ViewState
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.blue)
            VStack {
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 200)
                Spacer()
                    
                TextField("Email Address:" , text: $userInfo.userEmail).padding(.all)
                
               
                Button {
                    Auth.auth().sendPasswordReset(withEmail: userInfo.userEmail) { error in
                        if let error = error {
                            print(error.localizedDescription)
                        } else {
                            viewState = .authenticate
                        }
                    }
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

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword(viewState: Binding.constant(.forgotPassword))
    }
}
