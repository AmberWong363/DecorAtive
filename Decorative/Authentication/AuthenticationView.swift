//
//  AuthenticationView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/19/23.
//
//hi
//hi
//hi
//hiiiii
import SwiftUI
import FirebaseAuth

 
struct AuthenticationView: View {
    
    @EnvironmentObject var viewState: ViewState
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.blue)
            VStack {
                Spacer()
                
                Image("Icon-1").resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).frame(width: 300, height: 300, alignment: .center)
                
                Spacer()
                
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
