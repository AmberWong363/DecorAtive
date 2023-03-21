//
//  UserInfo.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/19/23.
//

import Foundation

class UserInfo: ObservableObject {
@Published var username: String
@Published var password: String
@Published var loggedIn: Bool = false
@Published var firstName: String
@Published var lastName: String
@Published var address: String
    
    var dictionary: [String: Any] {
        ["First Name": firstName, "Last Name": lastName, "Address": address]
    }

init(username: String = "", password: String = "") {
self.username = username
self.password = password
self.firstName = ""
self.lastName = ""
self.address = ""
    
    Auth.auth().addStateDidChangeListener { _, user in
        guard let user = user else {return}
        
        self.loggedIn.toggle()
        self.username = user.email ?? ""
        
    }
}
}
