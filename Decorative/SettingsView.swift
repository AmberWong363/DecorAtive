//
//  SettingsView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/6/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct SettingsView: View {
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text(userInfo.firstName)
            Text(userInfo.lastName)
            Text(userInfo.address)
            Spacer()
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Change first name").frame(width: 300, height: 50, alignment: .center).cornerRadius(20).background(Color.accentColor)
            }
        Button {
            showSheet.toggle()
        } label: {
            Text("Change last name").frame(width: 300, height: 50, alignment: .center).cornerRadius(20).background(Color.accentColor)
        }.padding()
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Change address").frame(width: 300, height: 50, alignment: .center).cornerRadius(20).background(Color.accentColor)
            }.padding()
        }.sheet(isPresented: $showSheet) {
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
           
            let database = Database.database().reference().child("users/\(uid)")
           
           
            database.setValue(userInfo.dictionary)
            
        } content: {
           
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
       
        SettingsView(viewState: Binding.constant(.authenticate))
    }
}
