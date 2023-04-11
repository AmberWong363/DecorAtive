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
                    
                TextField("Username or Email Address:" , text: $userInfo.userEmail) .padding()
                    .cornerRadius(20.0)
                
                SecureField("Password" , text: $userInfo.password) .padding()
                    .cornerRadius(20.0)
                   
                   
                
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
                    Button("Try Again", role: .cancel) {
                    }
                    
                        
                    Button {   self.viewState = .forgotPassword
                    } label: {
                        Text("Forgot Password")
                    }
                    HStack {
                    Button {
                        self.viewState = .forgotPassword
                    } label: {
                        Text("Forgot Password").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
      
                    }
                    
                    Button {
                        self.viewState = .authenticate
                    } label: {
                        Text("< Back").frame(width: 300, height: 50, alignment: .center).background(Color.white).cornerRadius(20)
                    }.padding(.all)
                    }
                    
                }
            }.background(
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                  .edgesIgnoringSafeArea(.all))
                
              
            }
        }
    




               
            


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewState: Binding.constant(.login))
    }
}


