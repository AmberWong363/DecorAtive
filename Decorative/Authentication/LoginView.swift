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
    @State private var isPresented = false
    
   
    
    var body: some View {
      
            VStack {
                Spacer()
                Text("Decor-ative")
                  .font(.largeTitle).foregroundColor(Color.white)
                  .padding([.top, .bottom], 40)
                Image("Icon").resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).frame(width: 300, height: 300, alignment: .center)
                Spacer()
                    
                TextField("Email Address:" , text: $userInfo.userEmail) .padding()
                    .cornerRadius(20.0).disableAutocorrection(true).autocapitalization(.none)
                
                SecureField("Password" , text: $userInfo.password) .padding()
                    .cornerRadius(20.0).disableAutocorrection(true).autocapitalization(.none)
                   
                   
                
                Button {
                    Auth.auth().signIn(withEmail: userInfo.userEmail, password: userInfo.password) { user, error in
                        if let _ = user{
                      print("success")
                        
                 } else{
                    isPresented = true
                    
                    }

                                            }
                    
                } label: {
                    Text("Login")  .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }.padding(.all).alert("Incorrect Password", isPresented: $isPresented) {
                    Button("Try Again", role: .cancel)
                    {
                    }
                    
                }
                    
                    HStack {
                        Spacer()
                    Button {
                        self.viewState = .forgotPassword
                    } label: {
                        Text("Forgot Password").frame(width: 150, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
      
                    }
                    Spacer()
                    Button {
                        self.viewState = .authenticate
                    } label: {
                        Text("< Back").frame(width: 150, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                    }
                        Spacer()
                    }
                    
                
            }.background(
                LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                  .edgesIgnoringSafeArea(.all))
                
              
            }
        
}
