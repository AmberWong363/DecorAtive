//
//  AuthenticationView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/19/23.
//

import SwiftUI
import FirebaseAuth

 
struct AuthenticationView: View {
    
    @EnvironmentObject var viewState: ViewState
    var body: some View {
        
        ZStack {
            // layers a blue background rectangle behind the content
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.blue)
            VStack {
                Spacer()
                // displays in a circle
                Image("Icon-1").resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).frame(width: 300, height: 300, alignment: .center)
                
                Spacer()
                // viewState is used to switch the view between the signup and login screens
                Button {
                    viewState.state = .signup
                } label: {
                    Text("Sign Up").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                }.padding(.all)
                
                Button {
                    viewState.state = .login
                } label: {
                    Text("Login").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                }.padding(.all)
            }
        }
    }
}
