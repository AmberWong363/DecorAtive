//
//  AuthenticationView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/19/23.
//

import SwiftUI
import FirebaseAuth

 
struct AuthenticationView: View {
    
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.blue)
            VStack {
                Spacer()
                Image("poke logo").resizable().aspectRatio(contentMode: .fit).frame(width: 200)
                Spacer()
                
                Button {
                    viewState = .signup
                } label: {
                    Text("Sign Up").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                }.padding(.all)
                
                Button {
                    viewState = .login
                } label: {
                    Text("Login").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                }.padding(.all)
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(viewState: Binding.constant(.authenticate))
    }
}
